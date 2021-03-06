import UIKit
import FirebaseDatabase

class VGandallerDetailCellLike:VGandallerDetailCell
{
    weak var label:UILabel!
    weak var labelCounter:UILabel!
    weak var button:UIButton!
    weak var modelLike:MGandallerDetailItemLike!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let label:UILabel = UILabel()
        label.userInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clearColor()
        label.font = UIFont.regular(12)
        label.textColor = UIColor(white:0.15, alpha:1)
        label.textAlignment = NSTextAlignment.Right
        label.text = NSLocalizedString("VGandallerDetailCellLike_label", comment:"")
        self.label = label
        
        let labelCounter:UILabel = UILabel()
        labelCounter.userInteractionEnabled = false
        labelCounter.translatesAutoresizingMaskIntoConstraints = false
        labelCounter.backgroundColor = UIColor.clearColor()
        labelCounter.font = UIFont.bold(12)
        labelCounter.textColor = UIColor.complement()
        labelCounter.textAlignment = NSTextAlignment.Right
        self.labelCounter = labelCounter
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named:"gandallerLiked"), forState:UIControlState.Highlighted)
        button.imageView?.clipsToBounds = true
        button.imageView?.contentMode = UIViewContentMode.Center
        button.addTarget(self, action:#selector(self.actionLike(sender:)), forControlEvents:UIControlEvents.TouchUpInside)
        self.button = button
        
        addSubview(label)
        addSubview(labelCounter)
        addSubview(button)
        
        let views:[String:AnyObject] = [
            "label":label,
            "button":button,
            "labelCounter":labelCounter]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[label(200)]-4-[button(40)]-9-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[labelCounter(200)]-0-[button]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[button]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[label]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[labelCounter]-0-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func config(model:MGandallerDetailItem)
    {
        modelLike = model as! MGandallerDetailItemLike
        button.hidden = true
        label.hidden = true
        labelCounter.hidden = true
        let gandallerId:String = modelLike.modelGandaller.gandallerId
        seekGandallerDb(gandallerId)
        hover()
    }
    
    //MARK: actions
    
    func actionLike(sender button:UIButton)
    {
        button.userInteractionEnabled = false
        justLiked()
        likeGandaller()
    }
    
    //MARK: private
    
    private func loadGandallerCounter()
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            if self != nil
            {
                let reference:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.Like
                let childId:String = self!.modelLike.modelGandaller.gandallerId
                
                FMain.sharedInstance.database.listenChildOnce(
                    reference,
                    child:childId)
                { [weak self] (snapshot) in
                    
                    let countKey:String = FDatabaseModelLike.FDatabaseModelLikeKey.Count.rawValue
                    let json:[String:AnyObject] = snapshot.value as! [String:AnyObject]
                    let count:Int = json[countKey] as! Int
                    let formatter:NSNumberFormatter = NSNumberFormatter()
                    formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                    let countString:String = formatter.stringFromNumber(count)!
                    
                    dispatch_async(dispatch_get_main_queue())
                    { [weak self] in
                        
                        self?.labelCounter.text = countString
                        self?.labelCounter.hidden = false
                    }
                }
            }
        }
    }
    
    private func likeGandaller()
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            if self != nil
            {
                let reference:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.Like
                let childId:String = self!.modelLike.modelGandaller.gandallerId
                
                FMain.sharedInstance.database.transactionChild(
                    reference,
                    childId:childId,
                    block:
                    { (data) -> (FIRTransactionResult) in
                        
                        let json:[String:AnyObject]? = data.value as? [String:AnyObject]
                        let fLike:FDatabaseModelLike = FDatabaseModelLike(json:json)
                        let jsonLike:[String:AnyObject] = fLike.modelJson()
                        data.value = jsonLike
                        let transactionResult:FIRTransactionResult = FIRTransactionResult.successWithValue(data)
                        
                        return transactionResult
                        
                    },
                    completion:
                { [weak self] (error, completed, snapshot) in
                    
                    self?.databaseLike()
                })
            }
        }
    }
    
    private func databaseLike()
    {
        DManager.sharedInstance.managerGandalla.createManagedObject(
            DGandallaGandaller.self)
        { [weak self] (object) in
            
            if self != nil
            {
                let gandallerId:String = self!.modelLike.modelGandaller.gandallerId
                let created:NSTimeInterval = NSDate().timeIntervalSince1970
                let user:DGandallaUser = MUser.sharedInstance.dbUser
                
                object.gandallerId = gandallerId
                object.created = created
                object.userLiked = user
                
                self!.loadGandallerCounter()
            }
        }
    }
    
    private func seekGandallerDb(gandallerId:String)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            let predicateString:String = String(format:"gandallerId == \"%@\"", gandallerId)
            let predicate:NSPredicate = NSPredicate(format:predicateString)
            DManager.sharedInstance.managerGandalla.fetchManagedObjects(
                DGandallaGandaller.self,
                limit:1,
                predicate:predicate)
            { (objects) in
                
                let liked:Bool = !objects.isEmpty
                
                dispatch_async(dispatch_get_main_queue())
                { [weak self] in
                    
                    if self != nil
                    {
                        if self!.modelLike.modelGandaller.gandallerId == gandallerId
                        {
                            if liked
                            {
                                self!.gandallerLiked(true)
                            }
                            else
                            {
                                self!.gandallerNotLiked()
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func justLiked()
    {
        DManager.sharedInstance.managerGandalla.saver.save(false)
        let alertMessage:String = NSLocalizedString("VGandallerDetailCellLike_liked", comment:"")
        VMainAlert.Message(alertMessage)
        
        dispatch_async(dispatch_get_main_queue())
        { [weak self] in
            
            self?.gandallerLiked(false)
        }
    }
    
    private func gandallerLiked(loadCounter:Bool)
    {
        label.hidden = true
        button.hidden = false
        button.userInteractionEnabled = false
        button.setImage(UIImage(named:"gandallerLiked"), forState:UIControlState.Normal)
        
        if loadCounter
        {
            loadGandallerCounter()
        }
    }
    
    private func gandallerNotLiked()
    {
        label.hidden = false
        button.hidden = false
        button.userInteractionEnabled = true
        button.setImage(UIImage(named:"gandallerLike"), forState:UIControlState.Normal)
    }
}
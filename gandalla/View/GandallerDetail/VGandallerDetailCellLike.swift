import UIKit

class VGandallerDetailCellLike:VGandallerDetailCell
{
    weak var label:UILabel!
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
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named:"gandallerLiked"), forState:UIControlState.Highlighted)
        button.imageView?.clipsToBounds = true
        button.imageView?.contentMode = UIViewContentMode.Center
        button.addTarget(self, action:#selector(self.actionLike(sender:)), forControlEvents:UIControlEvents.TouchUpInside)
        self.button = button
        
        addSubview(label)
        addSubview(button)
        
        let views:[String:AnyObject] = [
            "label":label,
            "button":button]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[label(200)]-4-[button(40)]-9-|",
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
    }
    
    required init?(coder:NSCoder)
    {
        super.init(coder:coder)
    }
    
    override func config(model:MGandallerDetailItem)
    {
        modelLike = model as! MGandallerDetailItemLike
        button.hidden = true
        label.hidden = true
        let gandallerId:String = modelLike.modelGandaller.gandallerId
        seekGandallerDb(gandallerId)
    }
    
    //MARK: actions
    
    func actionLike(sender button:UIButton)
    {
        button.userInteractionEnabled = false
        likeGandaller()
    }
    
    //MARK: private
    
    private func likeGandaller()
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            if self != nil
            {
                let reference:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.Like
                let childId:String = self!.modelLike.modelGandaller.gandallerId
                let property:String = FDatabaseModelLike.FDatabaseModelLikeKey.Received.rawValue
                let userId:String = MUser.sharedInstance.dbUser.userId
                let fLike:FDatabaseModelLike = FDatabaseModelLike(userId:userId)
                let jsonLike:[String:AnyObject] = fLike.modelJson()
                
                FMain.sharedInstance.database.createSubChild(
                    reference,
                    childId:childId,
                    property:property, json: <#T##[String : AnyObject]#>)
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
                
                self!.justLiked()
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
                                self!.gandallerLiked()
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
            
            self?.gandallerLiked()
        }
    }
    
    private func gandallerLiked()
    {
        label.hidden = true
        button.hidden = false
        button.userInteractionEnabled = false
        button.setImage(UIImage(named:"gandallerLiked"), forState:UIControlState.Normal)
    }
    
    private func gandallerNotLiked()
    {
        label.hidden = false
        button.hidden = false
        button.userInteractionEnabled = true
        button.setImage(UIImage(named:"gandallerLike"), forState:UIControlState.Normal)
    }
}
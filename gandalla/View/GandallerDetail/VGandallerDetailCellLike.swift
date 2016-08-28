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
        label.font = UIFont.regular(13)
        label.textColor = UIColor(white:0.3, alpha:1)
        label.textAlignment = NSTextAlignment.Right
        label.text = NSLocalizedString("VGandallerDetailCellLike_label", comment:"")
        self.label = label
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
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
            "H:[label(150)]-10-[button(50)]-10-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-15-[button]-15-|",
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
    }
    
    //MARK: private
    
    private func seekGandallerDb(gandallerId:String)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            let predicateString:String = String(format:"name == \"%@\"", gandallerId)
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
import UIKit

class VCreateHeader:UICollectionReusableView
{
    weak var controller:CCreate!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.backgroundColor = UIColor.complement()
        button.setTitle(NSLocalizedString("VCreateHeader_button", comment:""), forState:UIControlState.Normal)
        button.setTitleColor(UIColor.blackColor(), forState:UIControlState.Normal)
        button.setTitleColor(UIColor(white:0, alpha:0.2), forState:UIControlState.Highlighted)
        button.titleLabel?.font = UIFont.bold(14)
        button.layer.cornerRadius = 4
        button.addTarget(self, action:#selector(self.actionCreate(sender:)), forControlEvents:UIControlEvents.TouchUpInside)
        
        addSubview(button)
        
        let views:[String:AnyObject] = [
            "button":button]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-10-[button]-10-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-10-[button]-10-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    //MARK: actions
    
    func actionCreate(sender button:UIButton)
    {
        controller.createGandaller()
    }
    
    //MARK: public
    
    func config(controller:CCreate)
    {
        self.controller = controller
    }
}
import UIKit

class VCreateDetailCellNotify:VCreateDetailCell
{
    weak var button:UIButton!
    weak var model:MCreateItemDetailPropertyItemNotify!
    private let kSegmentedWidth:CGFloat = 160
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let button:UIButton = UIButton()
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.complement()
        button.setTitleColor(UIColor.whiteColor(), forState:UIControlState.Normal)
        button.setTitleColor(UIColor(white:1, alpha:0.2), forState:UIControlState.Highlighted)
        button.titleLabel?.font = UIFont.bold(15)
        button.layer.cornerRadius = 4
        button.addTarget(self, action:#selector(self.actionButton(sender:)), forControlEvents:UIControlEvents.TouchUpInside)
        self.button = button
        
        addSubview(button)
        
        let views:[String:AnyObject] = [
            "button":button]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-50-[button]-50-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-30-[button]-30-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    //MARK: actions
    
    func actionButton(sender button:UIButton)
    {
    }
}
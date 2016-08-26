import UIKit

class VCreateDetailCellStarted:VCreateDetailCell
{
    weak var check:UISwitch!
    weak var layoutCheckLeft:NSLayoutConstraint!
    weak var model:MCreateItemDetailPropertyItemStarted!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let check:UISwitch = UISwitch()
        check.translatesAutoresizingMaskIntoConstraints = false
        check.onTintColor = UIColor.complement()
        check.addTarget(self, action:#selector(self.actionCheck(sender:)), forControlEvents:UIControlEvents.TouchUpInside)
        self.check = check
        
        addSubview(check)
        
        let views:[String:AnyObject] = [
            "check":check]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-10-[check]",
            options:[],
            metrics:metrics,
            views:views))
        
        layoutCheckLeft = NSLayoutConstraint(
            item:check,
            attribute:NSLayoutAttribute.Left,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Left,
            multiplier:1,
            constant:0)
        
        addConstraint(layoutCheckLeft)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.maxX
        let checkWidth:CGFloat = check.bounds.maxX
        let remain:CGFloat = width - checkWidth
        let margin:CGFloat = remain / 2.0
        layoutCheckLeft.constant = margin
        
        super.layoutSubviews()
    }
    
    //MARK: actions
    
    func actionCheck(sender check:UISwitch)
    {
        check.userInteractionEnabled = false
        model.activate()
    }
}
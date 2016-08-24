import UIKit

class VCreateDetailCellImage:VCreateDetailCell
{
    weak var image:UIImageView!
    private let kButtonSize:CGFloat = 40
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let buttonRemove:UIButton = UIButton()
        buttonRemove.translatesAutoresizingMaskIntoConstraints = false
        buttonRemove.setImage(UIImage(named:"createListRemove"), forState:UIControlState.Normal)
        buttonRemove.imageView?.contentMode = UIViewContentMode.Center
        buttonRemove.imageView?.clipsToBounds = true
        
        let buttonAdd:UIButton = UIButton()
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        buttonAdd.setImage(UIImage(named:"createListAdd"), forState:UIControlState.Normal)
        buttonAdd.imageView?.contentMode = UIViewContentMode.Center
        buttonAdd.imageView?.clipsToBounds = true
        
        addSubview(buttonRemove)
        addSubview(buttonAdd)
        
        let views:[String:AnyObject] = [
            "buttonAdd":buttonAdd,
            "buttonRemove":buttonRemove]
        
        let metrics:[String:AnyObject] = [
            "buttonSize":kButtonSize]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-20-[buttonRemove(buttonSize)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[buttonAdd(buttonSize)]-20-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[buttonRemove]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[buttonAdd]-0-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}
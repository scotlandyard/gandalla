import UIKit

class VGandallersCell:UICollectionViewCell
{
    weak var base:UIView!
    private let kCornerRadius:CGFloat = 4
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
        
        let base:UIView = UIView()
        base.userInteractionEnabled = false
        base.clipsToBounds = true
        base.translatesAutoresizingMaskIntoConstraints = false
        base.backgroundColor = UIColor.whiteColor()
        base.layer.cornerRadius = kCornerRadius
        base.layer.borderWidth = 1
        base.layer.borderColor = UIColor(white:0.9, alpha:1).CGColor
        self.base = base
        
        addSubview(base)
        
        let views:[String:AnyObject] = [
            "base":base]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[base]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[base]-0-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}
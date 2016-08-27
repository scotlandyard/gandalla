import UIKit

class VGandallersCell:UICollectionViewCell
{
    weak var base:UIView!
    weak var image:UIImageView!
    weak var label:UILabel!
    weak var layoutImageHeight:NSLayoutConstraint!
    weak var layoutLabelHeight:NSLayoutConstraint!
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
        
        let image:UIImageView = UIImageView()
        image.userInteractionEnabled = false
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = UIViewContentMode.ScaleAspectFill
        self.image = image
        
        let label:UILabel = UILabel()
        label.userInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clearColor()
        label.textColor = UIColor(white:0.4, alpha:1)
        label.numberOfLines = 0
        
        addSubview(base)
        base.addSubview(image)
        base.addSubview(label)
        
        let views:[String:AnyObject] = [
            "base":base,
            "image":image,
            "label":label]
        
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
import UIKit

class VChampionsCell:UICollectionViewCell
{
    weak var label:UILabel!
    weak var image:UIImageView!
    weak var layoutImageTop:NSLayoutConstraint!
    weak var layoutImageLeft:NSLayoutConstraint!
    private let kImageSize:CGFloat = 200
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
        
        let label:UILabel = UILabel()
        label.userInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clearColor()
        label.font = UIFont.regular(15)
        label.textColor = UIColor(white:0.4, alpha:1)
        label.numberOfLines = 2
        self.label = label
        
        let image:UIImageView = UIImageView()
        image.userInteractionEnabled = false
        image.backgroundColor = UIColor(white:0.98, alpha:1)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = UIViewContentMode.ScaleAspectFill
        image.layer.cornerRadius = kImageSize / 2.0
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor(white:0.9, alpha:1).CGColor
        self.image = image
        
        addSubview(label)
        addSubview(image)
        
        let views:[String:AnyObject] = [
            "label":label,
            "image":image]
        
        let metrics:[String:AnyObject] = [
            "imageSize":kImageSize]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[image(imageSize)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[image(imageSize)]",
            options:[],
            metrics:metrics,
            views:views))
        
        layoutImageTop = NSLayoutConstraint(
            item:image,
            attribute:NSLayoutAttribute.Top,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Top,
            multiplier:1,
            constant:0)
        layoutImageLeft = NSLayoutConstraint(
            item:image,
            attribute:NSLayoutAttribute.Left,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Left,
            multiplier:1,
            constant:0)
        
        addConstraint(layoutImageTop)
        addConstraint(layoutImageLeft)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.maxX
        let height:CGFloat = bounds.maxY
        let remainX:CGFloat = width - kImageSize
        let remainY:CGFloat = height - kImageSize
        let marginX:CGFloat = remainX / 2.0
        let marginY:CGFloat = remainY / 2.0
        layoutImageTop.constant = marginY
        layoutImageLeft.constant = marginX
        
        super.layoutSubviews()
    }
    
    //MARK: public
    
    func config(model:MChampionsItem)
    {
        image.image = model.modelGandaller.image.imageBinary
    }
}
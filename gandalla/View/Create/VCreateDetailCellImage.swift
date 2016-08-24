import UIKit

class VCreateDetailCellImage:VCreateDetailCell
{
    weak var image:UIImageView!
    weak var layoutRemoveLeft:NSLayoutConstraint!
    private let kButtonSize:CGFloat = 40
    private let kImageWidth:CGFloat = 100
    private let kInterItem:CGFloat = 10
    private let itemsWidth:CGFloat
    
    override init(frame:CGRect)
    {
        itemsWidth = kButtonSize + kInterItem + kImageWidth + kInterItem + kButtonSize
        
        super.init(frame:frame)
        
        let image:UIImageView = UIImageView()
        image.userInteractionEnabled = false
        image.contentMode = UIViewContentMode.ScaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        self.image = image
        
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
        addSubview(image)
        
        let views:[String:AnyObject] = [
            "buttonAdd":buttonAdd,
            "buttonRemove":buttonRemove,
            "image":image]
        
        let metrics:[String:AnyObject] = [
            "buttonSize":kButtonSize,
            "imageWidth":kImageWidth,
            "interItem":kInterItem]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[buttonRemove(buttonSize)]-(interItem)-[image(imageWidth)]-(interItem)-[buttonAdd(buttonSize)]",
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
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-(interItem)-[image]-(interItem)-|",
            options:[],
            metrics:metrics,
            views:views))
        
        layoutRemoveLeft = NSLayoutConstraint(
            item:buttonRemove,
            attribute:NSLayoutAttribute.Left,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Left,
            multiplier:1,
            constant:0)
        
        addConstraint(layoutRemoveLeft)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func layoutSubviews()
    {
        let totalWidth:CGFloat = bounds.maxX
        let remain:CGFloat = totalWidth - itemsWidth
        let margin:CGFloat = remain / 2.0
        layoutRemoveLeft.constant = margin
        
        super.layoutSubviews()
    }
}
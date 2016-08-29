import UIKit

class VGandallersCell:UICollectionViewCell
{
    weak var base:UIView!
    weak var image:UIImageView!
    weak var label:UILabel!
    weak var layoutImageHeight:NSLayoutConstraint!
    weak var layoutLabelHeight:NSLayoutConstraint!
    weak var model:MGandallerListItem?
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
        base.layer.cornerRadius = kCornerRadius
        base.layer.borderWidth = 1
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
        label.numberOfLines = 0
        self.label = label
        
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
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[image]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-10-[label]-10-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[image]-10-[label]",
            options:[],
            metrics:metrics,
            views:views))
        
        layoutImageHeight = NSLayoutConstraint(
            item:image,
            attribute:NSLayoutAttribute.Height,
            relatedBy:NSLayoutRelation.Equal,
            toItem:nil,
            attribute:NSLayoutAttribute.NotAnAttribute,
            multiplier:1,
            constant:0)
        layoutLabelHeight = NSLayoutConstraint(
            item:label,
            attribute:NSLayoutAttribute.Height,
            relatedBy:NSLayoutRelation.Equal,
            toItem:nil,
            attribute:NSLayoutAttribute.NotAnAttribute,
            multiplier:1,
            constant:0)
        
        addConstraint(layoutImageHeight)
        addConstraint(layoutLabelHeight)
        
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector:#selector(self.notifiedImageLoaded(sender:)),
            name:NSNotification.NSNotificationName.GandallerImage.rawValue,
            object:nil)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func layoutSubviews()
    {
        model?.layoutConstraints()
        super.layoutSubviews()
    }
    
    override var selected:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    override var highlighted:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    //MARK: notified
    
    func notifiedImageLoaded(sender notification:NSNotification)
    {
        let userInfo:[String:AnyObject] = notification.userInfo as! [String:AnyObject]
        let gandallerKey:String = FDatabase.FDatabaseReference.Gandaller.rawValue
        let gandallerId:String = userInfo[gandallerKey] as! String
        
        if model != nil
        {
            if gandallerId == model!.modelGandaller.gandallerId
            {
                dispatch_async(dispatch_get_main_queue())
                { [weak self] in
                    
                    self?.placeImage()
                }
            }
        }
    }
    
    //MARK: private
    
    private func hover()
    {
        if selected || highlighted
        {
            base.backgroundColor = UIColor.main()
            base.layer.borderColor = UIColor.complement().CGColor
            label.textColor = UIColor.whiteColor()
        }
        else
        {
            base.backgroundColor = UIColor.whiteColor()
            base.layer.borderColor = UIColor(white:0.9, alpha:1).CGColor
            label.textColor = UIColor(white:0.5, alpha:1)
        }
    }
    
    //MARK: public
    
    func placeImage()
    {
        image.image = model?.modelGandaller.image.imageBinary
        hover()
    }
}
import UIKit

class VChampionsCell:UICollectionViewCell
{
    weak var image:UIImageView!
    weak var rate:VChampionsCellRate!
    weak var model:MChampionsItem?
    weak var layoutImageTop:NSLayoutConstraint!
    weak var layoutImageLeft:NSLayoutConstraint!
    weak var layoutRateTop:NSLayoutConstraint!
    weak var layoutRateLeft:NSLayoutConstraint!
    private let kImageSize:CGFloat = 180
    private let kRateSize:CGFloat = 220
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
        
        let image:UIImageView = UIImageView()
        image.userInteractionEnabled = false
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = UIViewContentMode.ScaleAspectFill
        image.layer.cornerRadius = kImageSize / 2.0
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.complement().CGColor
        self.image = image
        
        let rate:VChampionsCellRate = VChampionsCellRate()
        self.rate = rate
        
        addSubview(rate)
        addSubview(image)
        
        let views:[String:AnyObject] = [
            "image":image,
            "rate":rate]
        
        let metrics:[String:AnyObject] = [
            "imageSize":kImageSize,
            "rateSize":kRateSize]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[rate(rateSize)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[rate(rateSize)]",
            options:[],
            metrics:metrics,
            views:views))
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
        layoutRateTop = NSLayoutConstraint(
            item:rate,
            attribute:NSLayoutAttribute.Top,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Top,
            multiplier:1,
            constant:0)
        layoutRateLeft = NSLayoutConstraint(
            item:rate,
            attribute:NSLayoutAttribute.Left,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Left,
            multiplier:1,
            constant:0)
        
        addConstraint(layoutImageTop)
        addConstraint(layoutImageLeft)
        addConstraint(layoutRateTop)
        addConstraint(layoutRateLeft)
        
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
        let width:CGFloat = bounds.maxX
        let height:CGFloat = bounds.maxY
        
        let remainImageX:CGFloat = width - kImageSize
        let remainImageY:CGFloat = height - kImageSize
        let marginImageX:CGFloat = remainImageX / 2.0
        let marginImageY:CGFloat = remainImageY / 2.0
        layoutImageTop.constant = marginImageY
        layoutImageLeft.constant = marginImageX
        
        let remainRateX:CGFloat = width - kRateSize
        let remainRateY:CGFloat = height - kRateSize
        let marginRateX:CGFloat = remainRateX / 2.0
        let marginRateY:CGFloat = remainRateY / 2.0
        layoutRateTop.constant = marginRateY
        layoutRateLeft.constant = marginRateX
        
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
            alpha = 0.2
        }
        else
        {
            alpha = 1
        }
    }
    
    private func placeImage()
    {
        image.image = model!.modelGandaller.image.imageBinary
    }
    
    //MARK: public
    
    func config(model:MChampionsItem)
    {
        self.model = model
        placeImage()
//        rate.count(model.count)
    }
}
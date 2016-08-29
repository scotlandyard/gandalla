import UIKit

class VChampionsCell:UICollectionViewCell
{
    weak var image:UIImageView!
    weak var rate:VChampionsCellRate!
    weak var layoutImageTop:NSLayoutConstraint!
    weak var layoutImageLeft:NSLayoutConstraint!
    private let kImageSize:CGFloat = 180
    private let kRateSize:CGFloat = 130
    private let KRateMarginLeft:CGFloat = -65
    private let KRateMarginBottom:CGFloat = 30
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
        
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
        
        let rate:VChampionsCellRate = VChampionsCellRate()
        self.rate = rate
        
        addSubview(image)
        addSubview(rate)
        
        let views:[String:AnyObject] = [
            "image":image,
            "rate":rate]
        
        let metrics:[String:AnyObject] = [
            "imageSize":kImageSize,
            "rateSize":kRateSize,
            "rateMarginLeft":KRateMarginLeft,
            "rateMarginBottom":KRateMarginBottom]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[image(imageSize)]-(rateMarginLeft)-[rate(rateSize)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[image(imageSize)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[rate(rateSize)]-(rateMarginBottom)-|",
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
        let remainX:CGFloat = width - (kImageSize + KRateMarginLeft + kRateSize)
        let remainY:CGFloat = height - kImageSize
        let marginX:CGFloat = remainX / 2.0
        let marginY:CGFloat = remainY / 2.0
        layoutImageTop.constant = marginY
        layoutImageLeft.constant = marginX
        
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
    
    //MARK: public
    
    func config(model:MChampionsItem)
    {
        image.image = model.modelGandaller.image.imageBinary
        rate.count(model.count)
    }
}
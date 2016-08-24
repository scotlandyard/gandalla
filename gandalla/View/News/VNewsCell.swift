import UIKit

class VNewsCell:UICollectionViewCell
{
    weak var labelGandaller:UILabel!
    weak var labelDate:UILabel!
    weak var imageGandaller:UIImageView!
    private let kImageSize:CGFloat = 30
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
        
        let labelGandaller:UILabel = UILabel()
        labelGandaller.translatesAutoresizingMaskIntoConstraints = false
        labelGandaller.backgroundColor = UIColor.clearColor()
        labelGandaller.font = UIFont.bold(12)
        labelGandaller.textColor = UIColor(white:0.2, alpha:1)
        labelGandaller.userInteractionEnabled = false
        self.labelGandaller = labelGandaller
        
        let labelDate:UILabel = UILabel()
        labelDate.translatesAutoresizingMaskIntoConstraints = false
        labelDate.backgroundColor = UIColor.clearColor()
        labelDate.font = UIFont.regular(12)
        labelDate.textColor = UIColor(white:0.4, alpha:1)
        labelDate.userInteractionEnabled = false
        labelDate.textAlignment = NSTextAlignment.Right
        self.labelDate = labelDate
        
        let imageGandaller:UIImageView = UIImageView()
        imageGandaller.userInteractionEnabled = false
        imageGandaller.contentMode = UIViewContentMode.ScaleToFill
        imageGandaller.clipsToBounds = true
        imageGandaller.translatesAutoresizingMaskIntoConstraints = false
        self.imageGandaller = imageGandaller
        
        addSubview(imageGandaller)
        addSubview(labelGandaller)
        addSubview(labelDate)
        
        let views:[String:AnyObject] = [
            "labelGandaller":labelGandaller,
            "imageGandaller":imageGandaller,
            "labelDate":labelDate]
        
        let metrics:[String:AnyObject] = [
            "imageSize":kImageSize]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-10-[imageGandaller(imageSize)]-5-[labelGandaller]-10-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[labelDate(150)]-10-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-10-[imageGandaller(imageSize)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-10-[labelGandaller(imageSize)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[labelDate(14)]-10-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
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
    
    func config(model:MNewsItem)
    {
        labelGandaller.text = model.gandaller.fModel.name
        labelDate.text = model.date
    }
    
    func selected(model:MNewsItem, controller:CNews)
    {
    }
}
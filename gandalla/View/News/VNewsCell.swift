import UIKit

class VNewsCell:UICollectionViewCell
{
    weak var labelGandaller:UILabel!
    weak var imageGandaller:UIImageView!
    private let kImageSize:CGFloat = 40
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
        
        let labelGandaller:UILabel = UILabel()
        labelGandaller.translatesAutoresizingMaskIntoConstraints = false
        labelGandaller.backgroundColor = UIColor.clearColor()
        labelGandaller.font = UIFont.bold(12)
        labelGandaller.textColor = UIColor(white:0.3, alpha:1)
        labelGandaller.userInteractionEnabled = false
        self.labelGandaller = labelGandaller
        
        let imageGandaller:UIImageView = UIImageView()
        imageGandaller.userInteractionEnabled = false
        imageGandaller.contentMode = UIViewContentMode.ScaleToFill
        imageGandaller.clipsToBounds = true
        imageGandaller.translatesAutoresizingMaskIntoConstraints = false
        self.imageGandaller = imageGandaller
        
        addSubview(imageGandaller)
        addSubview(labelGandaller)
        
        let views:[String:AnyObject] = [
            "labelGandaller":labelGandaller,
            "imageGandaller":imageGandaller]
        
        let metrics:[String:AnyObject] = [
            "imageSize":kImageSize]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-10-[imageGandaller(imageSize)]-0-[labelGandaller]-10-|",
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
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    //MARK: public
    
    func config(model:MNewsItem)
    {
        labelGandaller.text = model.gandaller.fModel.name
    }
    
    func selected(model:MNewsItem, controller:CNews)
    {
    }
}
import UIKit

class VNewsCellPicture:VNewsCell
{
    weak var image:UIImageView!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let image:UIImageView = UIImageView()
        image.userInteractionEnabled = false
        image.contentMode = UIViewContentMode.ScaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        self.image = image
        
        addSubview(image)
        
        let views:[String:AnyObject] = [
            "image":image,
            "labelGandaller":labelGandaller,
            "imageGandaller":imageGandaller]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[imageGandaller]-10-[image]-10-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[labelGandaller]-10-[image]-10-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func config(model:MNewsItem)
    {
        super.config(model)
        
        let fNewsPicture:FDatabaseModelNewsPicture = model.fModel as! FDatabaseModelNewsPicture
        let pictureId:String = fNewsPicture.pictureId
        
        
    }
}
import UIKit

class VNewsCellPicture:VNewsCell
{
    weak var image:UIImageView!
    private var imageId:String?
    private let kCornerRadius:CGFloat = 4
    private let kImageSize:CGFloat = 80
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        backgroundColor = UIColor.clearColor()
        
        let image:UIImageView = UIImageView()
        image.userInteractionEnabled = false
        image.contentMode = UIViewContentMode.ScaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        self.image = image
        
        addSubview(image)
        
        let views:[String:AnyObject] = [
            "image":image,
            "labelGandaller":labelGandaller,
            "imageGandaller":imageGandaller]
        
        let metrics:[String:AnyObject] = [
            "imageSize":kImageSize]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[imageGandaller]-10-[image(imagesize)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[labelGandaller]-10-[image(imageSize)]",
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
        let reference:FStorage.FStorageReference = FStorage.FStorageReference.Gandaller
        let gandallerId:String = gandaller!.gandallerId
        imageId = pictureId
        
        FMain.sharedInstance.storage.loadData(
            reference,
            parentId:gandallerId,
            childId:pictureId)
        { [weak self] (data) in
            
            self?.imageReceived(data, imageId:pictureId)
        }
    }
    
    //MARK: private
    
    private func imageReceived(data:NSData?, imageId:String)
    {
        if data != nil
        {
            let imageBinary:UIImage = UIImage(data:data!)!
            
            dispatch_async(dispatch_get_main_queue())
            { [weak self] in
                
                if imageId == self?.imageId
                {
                    self?.image.image = imageBinary
                }
            }
        }
    }
}
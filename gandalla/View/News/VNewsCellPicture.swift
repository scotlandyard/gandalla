import UIKit

class VNewsCellPicture:VNewsCell
{
    weak var image:UIImageView!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        backgroundColor = UIColor.clearColor()
        
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
        let reference:FStorage.FStorageReference = FStorage.FStorageReference.Gandaller
        let gandallerId:String = gandaller!.gandallerId
        
        FMain.sharedInstance.storage.loadData(
            reference,
            parentId:gandallerId,
            childId:pictureId)
        { [weak self] (data) in
            
            self?.imageReceived(data, gandallerId:gandallerId)
        }
    }
    
    //MARK: private
    
    private func imageReceived(data:NSData?, gandallerId:String)
    {
        if data != nil
        {
            let imageBinary:UIImage = UIImage(data:data!)!
            
            dispatch_async(dispatch_get_main_queue())
            { [weak self] in
                
                if gandallerId == self?.gandaller?.gandallerId
                {
                    self?.image.image = imageBinary
                }
            }
        }
    }
}
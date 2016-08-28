import UIKit

class VGandallerDetailCellPicturesCell:UICollectionViewCell
{
    weak var image:UIImageView!
    weak var model:MGandallerDetailItemPicturesItem?
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        userInteractionEnabled = false
        backgroundColor = UIColor(white:0.85, alpha:1)
        
        let image:UIImageView = UIImageView()
        image.userInteractionEnabled = false
        image.clipsToBounds = true
        image.contentMode = UIViewContentMode.ScaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        self.image = image
        
        addSubview(image)
        
        let views:[String:AnyObject] = [
            "image":image]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[image]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[image]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector:#selector(self.notifiedImageLoaded(sender:)),
            name:NSNotification.NSNotificationName.ImageLoaded.rawValue,
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
    
    //MARK: notified
    
    func notifiedImageLoaded(sender notification:NSNotification)
    {
        let userInfo:[String:AnyObject] = notification.userInfo as! [String:AnyObject]
        let imagesKey:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.Images.rawValue
        let imageId:String = userInfo[imagesKey] as! String
        
        if model != nil
        {
            if imageId == model!.imageId
            {
                dispatch_async(dispatch_get_main_queue())
                { [weak self] in
                    
                    self?.placeImage()
                }
            }
        }
    }
    
    //MARK: private
    
    private func placeImage()
    {
        image.image = model?.imageBinary
    }
    
    //MARK: public
    
    func config(model:MGandallerDetailItemPicturesItem)
    {
        self.model = model
        placeImage()
    }
}
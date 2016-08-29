import UIKit

class VLikedCell:UICollectionViewCell
{
    weak var image:UIImageView!
    weak var label:UILabel!
    weak var model:MLikedItem?
    private let kCornerRadius:CGFloat = 4
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
        
        let image:UIImageView = UIImageView()
        image.userInteractionEnabled = false
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = UIViewContentMode.ScaleAspectFill
        image.backgroundColor = UIColor.collectionBackground()
        image.layer.cornerRadius = kCornerRadius
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor(white:0.5, alpha:1).CGColor
        self.image = image
        
        let label:UILabel = UILabel()
        label.userInteractionEnabled = false
        label.backgroundColor = UIColor.clearColor()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.bold(16)
        label.textColor = UIColor(white:0.2, alpha:1)
        self.label = label
        
        addSubview(image)
        addSubview(label)
        
        let views:[String:AnyObject] = [
            "image":image,
            "label":label]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-5-[image(55)]-7-[label]-10-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-5-[image]-5-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[label]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        
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
    
    func config(model:MLikedItem)
    {
        self.model = model
        placeImage()
        label.text = model.modelGandaller.fModel.name
    }
}
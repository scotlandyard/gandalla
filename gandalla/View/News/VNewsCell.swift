import UIKit

class VNewsCell:UICollectionViewCell
{
    weak var labelGandaller:UILabel!
    weak var labelDate:UILabel!
    weak var imageGandaller:UIImageView!
    weak var gandaller:MGandallerItem!
    private let kImageSize:CGFloat = 50
    private let kCornerRadius:CGFloat = 4
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
        
        let labelGandaller:UILabel = UILabel()
        labelGandaller.translatesAutoresizingMaskIntoConstraints = false
        labelGandaller.backgroundColor = UIColor.clearColor()
        labelGandaller.font = UIFont.bold(13)
        labelGandaller.textColor = UIColor(white:0.2, alpha:1)
        labelGandaller.userInteractionEnabled = false
        self.labelGandaller = labelGandaller
        
        let labelDate:UILabel = UILabel()
        labelDate.translatesAutoresizingMaskIntoConstraints = false
        labelDate.backgroundColor = UIColor.clearColor()
        labelDate.font = UIFont.regular(10)
        labelDate.textColor = UIColor(white:0.3, alpha:1)
        labelDate.userInteractionEnabled = false
        labelDate.textAlignment = NSTextAlignment.Right
        self.labelDate = labelDate
        
        let imageGandaller:UIImageView = UIImageView()
        imageGandaller.userInteractionEnabled = false
        imageGandaller.contentMode = UIViewContentMode.ScaleToFill
        imageGandaller.clipsToBounds = true
        imageGandaller.translatesAutoresizingMaskIntoConstraints = false
        imageGandaller.layer.borderWidth = 1
        imageGandaller.layer.borderColor = UIColor(white:0, alpha:0.1).CGColor
        imageGandaller.layer.cornerRadius = kCornerRadius
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
            "H:|-10-[imageGandaller(imageSize)]-10-[labelGandaller]-10-|",
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
            "V:|-10-[labelGandaller(17)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[labelDate(14)]-8-|",
            options:[],
            metrics:metrics,
            views:views))
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
        
        if gandallerId == gandaller.gandallerId
        {
            NSNotificationCenter.defaultCenter().removeObserver(self)
            
            dispatch_async(dispatch_get_main_queue())
            { [weak self] in
                
                self?.imageGandaller.image = self?.gandaller.image.imageBinary
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
    
    //MARK: public
    
    func config(model:MNewsItem)
    {
        NSNotificationCenter.defaultCenter().removeObserver(self)
        
        if gandaller !== model.gandaller
        {
            gandaller = model.gandaller
            labelGandaller.text = gandaller.fModel.name
            imageGandaller.image = nil
            
            if model.gandaller.image.imageId != nil
            {
                if model.gandaller.image.imageBinary == nil
                {
                    NSNotificationCenter.defaultCenter().addObserver(
                        self,
                        selector:#selector(self.notifiedImageLoaded(sender:)),
                        name:NSNotification.NSNotificationName.GandallerImage.rawValue,
                        object:nil)
                }
                else
                {
                    imageGandaller.image = model.gandaller.image.imageBinary
                }
            }
        }
        
        labelDate.text = model.date
    }
    
    func selected(model:MNewsItem, controller:CNews)
    {
    }
}
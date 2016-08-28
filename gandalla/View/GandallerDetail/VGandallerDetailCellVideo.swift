import UIKit

class VGandallerDetailCellVideo:VGandallerDetailCell
{
    weak var label:UILabel!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        backgroundColor = UIColor.whiteColor()
        
        let label:UILabel = UILabel()
        label.userInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clearColor()
        label.font = UIFont.regular(12)
        label.textColor = UIColor(white:0.4, alpha:1)
        label.numberOfLines = 2
        self.label = label
        
        let icon:UIImageView = UIImageView()
        icon.userInteractionEnabled = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.clipsToBounds = true
        icon.contentMode = UIViewContentMode.Center
        icon.image = UIImage(named:"gandallerVideo")
        
        let iconPlay:UIImageView = UIImageView()
        iconPlay.userInteractionEnabled = false
        iconPlay.translatesAutoresizingMaskIntoConstraints = false
        iconPlay.clipsToBounds = true
        iconPlay.contentMode = UIViewContentMode.Center
        iconPlay.image = UIImage(named:"gandallerVideoPlay")
        
        addSubview(label)
        addSubview(icon)
        addSubview(iconPlay)
        
        let views:[String:AnyObject] = [
            "label":label,
            "icon":icon,
            "iconPlay":iconPlay]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[icon(35)]-0-[label]-0-[iconPlay(30)]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[label]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[icon]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[iconPlay]-0-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func config(model:MGandallerDetailItem)
    {
        let modelVideo:MGandallerDetailItemVideo = model as! MGandallerDetailItemVideo
        let url:String = modelVideo.url
        label.text = url
        hover()
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
}
import UIKit

class VGandallerDetailCellSocial:VGandallerDetailCell
{
    weak var label:UILabel!
    weak var icon:UIImageView!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        backgroundColor = UIColor.whiteColor()
        userInteractionEnabled = false
        
        let label:UILabel = UILabel()
        label.userInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clearColor()
        label.font = UIFont.bold(16)
        label.textColor = UIColor(white:0.5, alpha:1)
        self.label = label
        
        let icon:UIImageView = UIImageView()
        icon.userInteractionEnabled = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.clipsToBounds = true
        icon.contentMode = UIViewContentMode.Center
        self.icon = icon
        
        addSubview(label)
        addSubview(icon)
        
        let views:[String:AnyObject] = [
            "label":label,
            "icon":icon]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[icon(35)]-0-[label]-10-|",
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
    }
    
    required init?(coder:NSCoder)
    {
        super.init(coder:coder)
    }
    
    override func config(model:MGandallerDetailItem)
    {
        let modelSocial:MGandallerDetailItemSocial = model as! MGandallerDetailItemSocial
        label.text = modelSocial.title
        icon.image = UIImage(named:modelSocial.icon)
    }
}
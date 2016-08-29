import UIKit

class VGandallerDetailCellPower:VGandallerDetailCell
{
    weak var label:UILabel!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        backgroundColor = UIColor.whiteColor()
        userInteractionEnabled = false
        
        let label:UILabel = UILabel()
        label.userInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clearColor()
        label.font = UIFont.regular(15)
        label.textColor = UIColor(white:0.4, alpha:1)
        label.numberOfLines = 2
        self.label = label
        
        let icon:UIImageView = UIImageView()
        icon.userInteractionEnabled = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.clipsToBounds = true
        icon.contentMode = UIViewContentMode.Center
        icon.image = UIImage(named:"gandallerPower")
        
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
        fatalError()
    }
    
    override func config(model:MGandallerDetailItem)
    {
        let modelPower:MGandallerDetailItemPower = model as! MGandallerDetailItemPower
        let power:String = modelPower.power
        label.text = power
        hover()
    }
}
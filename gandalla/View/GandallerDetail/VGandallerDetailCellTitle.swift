import UIKit

class VGandallerDetailCellTitle:VGandallerDetailCell
{
    weak var label:UILabel!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        userInteractionEnabled = false
        
        let label:UILabel = UILabel()
        label.userInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clearColor()
        label.font = UIFont.bold(12)
        label.textColor = UIColor(white:0.6, alpha:1)
        self.label = label
        
        addSubview(label)
        
        let views:[String:AnyObject] = [
            "label":label]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-10-[label(200)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[label(15)]-10-|",
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
        let modelTitle:MGandallerDetailItemTitle = model as! MGandallerDetailItemTitle
        label.text = modelTitle.title
    }
}
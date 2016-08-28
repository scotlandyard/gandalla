import UIKit

class VGandallerDetailCellProfile:VGandallerDetailCell
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
        label.font = UIFont.bold(18)
        label.textColor = UIColor(white:0.4, alpha:1)
        self.label = label
        
        addSubview(label)
        
        let views:[String:AnyObject] = [
            "label":label]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-10-[label]-10-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[label]-0-|",
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
        let modelProfile:MGandallerDetailItemProfile = model as! MGandallerDetailItemProfile
        let gandallerName:String = modelProfile.modelGandaller.fModel.name
        label.text = gandallerName
    }
}
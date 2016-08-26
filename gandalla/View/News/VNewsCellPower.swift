import UIKit

class VNewsCellPower:VNewsCell
{
    weak var labelEvent:UILabel!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let labelEvent:UILabel = UILabel()
        labelEvent.translatesAutoresizingMaskIntoConstraints = false
        labelEvent.backgroundColor = UIColor.clearColor()
        labelEvent.font = UIFont.bold(16)
        labelEvent.textColor = UIColor(white:0.4, alpha:1)
        labelEvent.userInteractionEnabled = false
        self.labelEvent = labelEvent
        
        let labelTitle:UILabel = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clearColor()
        labelTitle.font = UIFont.regular(13)
        labelTitle.textColor = UIColor(white:0.5, alpha:1)
        labelTitle.userInteractionEnabled = false
        labelTitle.text = NSLocalizedString("VNewsCellJoined_labelPower", comment:"")
        
        addSubview(labelEvent)
        addSubview(labelTitle)
        
        let views:[String:AnyObject] = [
            "imageGandaller":imageGandaller,
            "labelGandaller":labelGandaller,
            "labelEvent":labelEvent,
            "labelTitle":labelTitle]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[imageGandaller]-10-[labelEvent]-10-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[imageGandaller]-10-[labelTitle]-10-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[labelGandaller]-10-[labelTitle(19)]-0-[labelEvent(20)]",
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
        
        let fModelPower:FDatabaseModelNewsPower = model.fModel as! FDatabaseModelNewsPower
        labelEvent.text = fModelPower.power
    }
}
import UIKit

class VNewsCellJoined:VNewsCell
{
    weak var labelEvent:UILabel!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let labelEvent:UILabel = UILabel()
        labelEvent.translatesAutoresizingMaskIntoConstraints = false
        labelEvent.backgroundColor = UIColor.clearColor()
        labelEvent.font = UIFont.bold(16)
        labelEvent.textColor = UIColor.complement()
        labelEvent.userInteractionEnabled = false
        self.labelEvent = labelEvent
        
        addSubview(labelEvent)
        
        let views:[String:AnyObject] = [
            "labelGandaller":labelGandaller,
            "imageGandaller":imageGandaller,
            "labelEvent":labelEvent]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[imageGandaller]-5-[labelEvent]-10-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[labelGandaller]-0-[labelEvent(22)]",
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
        
        labelEvent.text = NSLocalizedString("VNewsCellJoined_labelEvent", comment:"")
    }
}
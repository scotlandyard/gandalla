import UIKit

class VNewsCellJoined:VNewsCell
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let labelEvent:UILabel = UILabel()
        labelEvent.translatesAutoresizingMaskIntoConstraints = false
        labelEvent.backgroundColor = UIColor.clearColor()
        labelEvent.font = UIFont.bold(15)
        labelEvent.textColor = UIColor.complement()
        labelEvent.userInteractionEnabled = false
        labelEvent.text = NSLocalizedString("VNewsCellJoined_labelEvent", comment:"")
        
        addSubview(labelEvent)
        
        let views:[String:AnyObject] = [
            "imageGandaller":imageGandaller,
            "labelGandaller":labelGandaller,
            "labelEvent":labelEvent]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[imageGandaller]-10-[labelEvent]-10-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[labelGandaller]-3-[labelEvent(18)]",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}
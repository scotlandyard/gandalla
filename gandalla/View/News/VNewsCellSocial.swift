import UIKit

class VNewsCellSocial:VNewsCell
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let labelEvent:UILabel = UILabel()
        labelEvent.translatesAutoresizingMaskIntoConstraints = false
        labelEvent.backgroundColor = UIColor.clearColor()
        labelEvent.font = UIFont.regular(14)
        labelEvent.textColor = UIColor(white:0.25, alpha:1)
        labelEvent.userInteractionEnabled = false
        labelEvent.text = NSLocalizedString("VNewsCellSocial_labelEvent", comment:"")
        
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
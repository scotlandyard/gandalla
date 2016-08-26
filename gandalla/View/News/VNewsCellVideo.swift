import UIKit

class VNewsCellVideo:VNewsCell
{
    weak var labelEvent:UILabel!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let labelEvent:UILabel = UILabel()
        labelEvent.translatesAutoresizingMaskIntoConstraints = false
        labelEvent.backgroundColor = UIColor.clearColor()
        labelEvent.font = UIFont.regular(11)
        labelEvent.textColor = UIColor(white:0.4, alpha:1)
        labelEvent.userInteractionEnabled = false
        self.labelEvent = labelEvent
        
        let labelTitle:UILabel = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clearColor()
        labelTitle.font = UIFont.regular(12)
        labelTitle.textColor = UIColor.blackColor()
        labelTitle.userInteractionEnabled = false
        labelTitle.text = NSLocalizedString("VNewsCellVideo_labelEvent", comment:"")
        
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
            "V:[labelGandaller]-5-[labelTitle(19)]-0-[labelEvent(15)]",
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
        
        let fModelVideo:FDatabaseModelNewsVideo = model.fModel as! FDatabaseModelNewsVideo
        labelEvent.text = fModelVideo.url
    }
}
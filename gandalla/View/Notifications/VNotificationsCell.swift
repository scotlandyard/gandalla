import UIKit

class VNotificationsCell:UICollectionViewCell
{
    weak var label:UILabel!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        
        let label:UILabel = UILabel()
        label.backgroundColor = UIColor.clearColor()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.userInteractionEnabled = false
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.bold(14)
        self.label = label
        
        addSubview(label)
        
        let views:[String:AnyObject] = [
            "label":label]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[label]-0-|",
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
        fatalError()
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
    
    //MARK: public
    
    func hover()
    {
        if selected || highlighted
        {
            label.textColor = UIColor.whiteColor()
            backgroundColor = UIColor.complement()
        }
        else
        {
            label.textColor = UIColor.complement()
            backgroundColor = UIColor.clearColor()
        }
    }
    
    //MARK: public
    
    func config(model:MNotificationsItem)
    {
        label.text = model.title
    }
}
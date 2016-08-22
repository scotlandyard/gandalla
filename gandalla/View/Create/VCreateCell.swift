import UIKit

class VCreateCell:UICollectionViewCell
{
    weak var labelName:UILabel!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
        
        let labelName:UILabel = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.backgroundColor = UIColor.clearColor()
        labelName.textAlignment = NSTextAlignment.Center
        labelName.font = UIFont.bold(14)
        labelName.textColor = UIColor(white:0.3, alpha:1)
        labelName.userInteractionEnabled = false
        labelName.numberOfLines = 0
        self.labelName = labelName
        
        addSubview(labelName)
        
        let views:[String:AnyObject] = [
            "labelName":labelName]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-10-[labelName]-10-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[labelName]-0-|",
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
    
    //MARK: private
    
    private func hover()
    {
        if selected || highlighted
        {
            alpha = 0.1
        }
        else
        {
            alpha = 1
        }
    }
}
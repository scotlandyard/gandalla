import UIKit

class VCreateDetailHeader:UICollectionReusableView
{
    weak var labelName:UILabel!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
        
        let labelName:UILabel = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.backgroundColor = UIColor.clearColor()
        labelName.font = UIFont.bold(14)
        labelName.textColor = UIColor(white:0.4, alpha:1)
        labelName.userInteractionEnabled = false
        labelName.numberOfLines = 0
        labelName.textAlignment = NSTextAlignment.Center
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
            "V:|-10-[labelName]-0-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    //MARK: public
    
    func config(model:MCreateItemDetailProperty)
    {
        labelName.text = model.name
    }
}
import UIKit

class VCreateCell:UICollectionViewCell
{
    weak var labelName:UILabel!
    weak var imageStatus:UIImageView!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
        
        let labelName:UILabel = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.backgroundColor = UIColor.clearColor()
        labelName.font = UIFont.bold(14)
        labelName.textColor = UIColor(white:0.3, alpha:1)
        labelName.userInteractionEnabled = false
        labelName.numberOfLines = 0
        self.labelName = labelName
        
        let imageStatus:UIImageView = UIImageView()
        imageStatus.userInteractionEnabled = false
        imageStatus.contentMode = UIViewContentMode.Center
        imageStatus.clipsToBounds = true
        imageStatus.image = UIImage(named:"createGandallerStatus")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        imageStatus.translatesAutoresizingMaskIntoConstraints = false
        self.imageStatus = imageStatus
        
        addSubview(imageStatus)
        addSubview(labelName)
        
        let views:[String:AnyObject] = [
            "labelName":labelName,
            "imageStatus":imageStatus]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[imageStatus(30)]-0-[labelName]-10-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[labelName]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[imageStatus]-0-|",
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
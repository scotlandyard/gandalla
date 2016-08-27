import UIKit

class VGandallerDetailCell:UICollectionViewCell
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
    }
    
    required init?(coder:NSCoder)
    {
        super.init(coder:coder)
    }
}
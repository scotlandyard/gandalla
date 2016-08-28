import UIKit

class VGandallerDetailCellPicturesCell:UICollectionViewCell
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        userInteractionEnabled = false
        backgroundColor = UIColor(white:0.85, alpha:1)
    }
    
    required init?(coder:NSCoder)
    {
        super.init(coder:coder)
    }
}
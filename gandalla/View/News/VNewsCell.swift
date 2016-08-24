import UIKit

class VNewsCell:UICollectionViewCell
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}
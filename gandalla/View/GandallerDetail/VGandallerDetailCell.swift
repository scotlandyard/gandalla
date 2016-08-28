import UIKit

class VGandallerDetailCell:UICollectionViewCell
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
    }
    
    required init?(coder:NSCoder)
    {
        super.init(coder:coder)
    }
    
    //MARK: public
    
    func config(model:MGandallerDetailItem)
    {
    }
}
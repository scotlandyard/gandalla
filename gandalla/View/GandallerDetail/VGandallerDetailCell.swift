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
            alpha = 0.2
        }
        else
        {
            alpha = 1
        }
    }
    
    func config(model:MGandallerDetailItem)
    {
    }
}
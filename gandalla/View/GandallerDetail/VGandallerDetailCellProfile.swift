import UIKit

class VGandallerDetailCellProfile:VGandallerDetailCell
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        backgroundColor = UIColor.whiteColor()
        userInteractionEnabled = false
    }
    
    required init?(coder:NSCoder)
    {
        super.init(coder:coder)
    }
}
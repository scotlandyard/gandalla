import UIKit

class MGandallerDetailItemProfile:MGandallerDetailItem
{
    private let kCellHeight:CGFloat = 100
    
    init()
    {
        let reusableIdentifier:String = VGandallerDetailCellProfile.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
}
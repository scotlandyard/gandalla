import UIKit

class MGandallerDetailItemSocial:MGandallerDetailItem
{
    private let kCellHeight:CGFloat = 100
    
    init()
    {
        let reusableIdentifier:String = VGandallerDetailCellSocial.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
}
import UIKit

class MGandallerDetailItemHashtag:MGandallerDetailItem
{
    private let kCellHeight:CGFloat = 100
    
    init()
    {
        let reusableIdentifier:String = VGandallerDetailCellHashtag.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
}
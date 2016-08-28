import UIKit

class MGandallerDetailItemVideo:MGandallerDetailItem
{
    private let kCellHeight:CGFloat = 100
    
    init()
    {
        let reusableIdentifier:String = VGandallerDetailCellVideo.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
}
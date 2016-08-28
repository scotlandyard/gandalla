import UIKit

class MGandallerDetailItemHashtag:MGandallerDetailItem
{
    private let kCellHeight:CGFloat = 60
    let tag:String
    
    init(tag:String)
    {
        self.tag = tag
        let reusableIdentifier:String = VGandallerDetailCellHashtag.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
}
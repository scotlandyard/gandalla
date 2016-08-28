import UIKit

class MGandallerDetailItemHashtag:MGandallerDetailItem
{
    let tag:String
    private let kCellHeight:CGFloat = 60
    
    init(tag:String)
    {
        self.tag = tag
        let reusableIdentifier:String = VGandallerDetailCellHashtag.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
}
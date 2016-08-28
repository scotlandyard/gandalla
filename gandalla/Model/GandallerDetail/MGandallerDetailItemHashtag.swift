import UIKit

class MGandallerDetailItemHashtag:MGandallerDetailItem
{
    let tag:String
    private let kCellHeight:CGFloat = 60
    private let kSelectable:Bool = false
    
    init(tag:String)
    {
        self.tag = tag
        let reusableIdentifier:String = VGandallerDetailCellHashtag.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight, selectable:kSelectable)
    }
}
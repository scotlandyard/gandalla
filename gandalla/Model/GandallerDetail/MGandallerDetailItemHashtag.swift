import UIKit

class MGandallerDetailItemHashtag:MGandallerDetailItem
{
    let tag:String
    private let kCellHeight:CGFloat = 25
    private let kSelectable:Bool = true
    
    init(tag:String)
    {
        self.tag = tag
        let reusableIdentifier:String = VGandallerDetailCellHashtag.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight, selectable:kSelectable)
    }
    
    override func selected(controller: CGandallerDetail)
    {
        
    }
}
import UIKit

class MGandallerDetailItemSocial:MGandallerDetailItem
{
    let title:String
    private let kCellHeight:CGFloat = 35
    private let kSelectable:Bool = false
    
    init(title:String, icon:String)
    {
        self.title = title
        let reusableIdentifier:String = VGandallerDetailCellSocial.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight, selectable:kSelectable)
    }
}
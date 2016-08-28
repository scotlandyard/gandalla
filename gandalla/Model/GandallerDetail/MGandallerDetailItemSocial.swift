import UIKit

class MGandallerDetailItemSocial:MGandallerDetailItem
{
    let title:String
    let icon:String
    private let kCellHeight:CGFloat = 40
    private let kSelectable:Bool = false
    
    init(title:String, icon:String)
    {
        self.title = title
        self.icon = icon
        let reusableIdentifier:String = VGandallerDetailCellSocial.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight, selectable:kSelectable)
    }
}
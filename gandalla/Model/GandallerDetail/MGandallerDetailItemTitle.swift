import UIKit

class MGandallerDetailItemTitle:MGandallerDetailItem
{
    let title:String
    private let kCellHeight:CGFloat = 40
    private let kSelectable:Bool = false
    
    init(title:String)
    {
        self.title = title
        let reusableIdentifier:String = VGandallerDetailCellPower.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight, selectable:kSelectable)
    }
}
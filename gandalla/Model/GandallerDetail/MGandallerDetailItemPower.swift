import UIKit

class MGandallerDetailItemPower:MGandallerDetailItem
{
    let power:String
    private let kCellHeight:CGFloat = 120
    private let kSelectable:Bool = false
    
    init(power:String)
    {
        self.power = power
        let reusableIdentifier:String = VGandallerDetailCellPower.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight, selectable:kSelectable)
    }
}
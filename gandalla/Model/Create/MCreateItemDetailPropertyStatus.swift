import UIKit

class MCreateItemDetailPropertyStatus:MCreateItemDetailProperty
{
    private let kCellHeight:CGFloat = 60
    
    init()
    {
        let name:String = NSLocalizedString("MCreateItemDetailPropertyStatus_name", comment:"")
        let reusableIdentifier:String = VCreateDetailCellStatus.reusableIdentifier()
        let itemStatus:MCreateItemDetailPropertyItemStatus = MCreateItemDetailPropertyItemStatus()
        let items:[MCreateItemDetailPropertyItem] = [
            itemStatus
        ]
        
        super.init(name:name, reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight, items:items)
    }
}
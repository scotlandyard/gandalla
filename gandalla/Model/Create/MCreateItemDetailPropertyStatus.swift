import UIKit

class MCreateItemDetailPropertyStatus:MCreateItemDetailProperty
{
    private let kCellHeight:CGFloat = 60
    
    override init(fModel:FDatabaseModelGandaller)
    {
        let name:String = NSLocalizedString("MCreateItemDetailPropertyStatus_name", comment:"")
        let reusableIdentifier:String = VCreateDetailCellStatus.reusableIdentifier()
        let itemStatus:MCreateItemDetailPropertyItemStatus = MCreateItemDetailPropertyItemStatus(status:fModel.status)
        let items:[MCreateItemDetailPropertyItem] = [
            itemStatus
        ]
        
        super.init(name:name, reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight, items:items)
    }
}
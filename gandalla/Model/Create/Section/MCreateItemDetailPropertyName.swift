import UIKit

class MCreateItemDetailPropertyName:MCreateItemDetailProperty
{
    private let kCellHeight:CGFloat = 60
    
    override init(gandallerId:String, fModel:FDatabaseModelGandaller)
    {
        let gandallerName:String = fModel.name
        let name:String = NSLocalizedString("MCreateItemDetailPropertyName_name", comment:"")
        let reusableIdentifier:String = VCreateDetailCellText.reusableIdentifier()
        let itemName:MCreateItemDetailPropertyItemName = MCreateItemDetailPropertyItemName(name:gandallerName)
        let items:[MCreateItemDetailPropertyItem] = [
            itemName
        ]
        
        super.init(name:name, reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight, items:items)
    }
}
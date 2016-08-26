import UIKit

class MCreateItemDetailPropertyNotifications:MCreateItemDetailProperty
{
    private let kCellHeight:CGFloat = 95
    private let kAddAvailable:Bool = false
    
    override init(gandallerId:String, fModel:FDatabaseModelGandaller)
    {
        let name:String = NSLocalizedString("MCreateItemDetailPropertyNotifications_name", comment:"")
        let reusableIdentifier:String = VCreateDetailCellNotify.reusableIdentifier()
        let titleNotify:String = NSLocalizedString("MCreateItemDetailPropertyNotifications_social", comment:"")
        let itemNotify:MCreateItemDetailPropertyItemNotify = MCreateItemDetailPropertyItemNotify(gandallerId:gandallerId, title:titleNotify)
        let items:[MCreateItemDetailPropertyItem] = [
            itemNotify
        ]
        
        super.init(name:name, reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight, items:items, addAvailable:kAddAvailable)
    }
}
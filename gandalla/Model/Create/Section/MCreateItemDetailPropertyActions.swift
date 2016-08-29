import UIKit

class MCreateItemDetailPropertyNotifications:MCreateItemDetailProperty
{
    private let kCellHeight:CGFloat = 55
    private let kAddAvailable:Bool = false
    
    override init(gandallerId:String, fModel:FDatabaseModelGandaller)
    {
        let name:String = NSLocalizedString("MCreateItemDetailPropertyActions_name", comment:"")
        let reusableIdentifier:String = VCreateDetailCellAction.reusableIdentifier()
        let itemSocialNotification:MCreateItemDetailPropertyItemActionSocialNotification = MCreateItemDetailPropertyItemActionSocialNotification(gandallerId:gandallerId)
        let itemRemoveUnlessJoined:MCreateItemDetailPropertyItemActionRemoveUnlessJoined = MCreateItemDetailPropertyItemActionRemoveUnlessJoined(gandallerId:gandallerId)
        
        let items:[MCreateItemDetailPropertyItem] = [
            itemSocialNotification,
            itemRemoveUnlessJoined
        ]
        
        super.init(name:name, reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight, items:items, addAvailable:kAddAvailable)
    }
}
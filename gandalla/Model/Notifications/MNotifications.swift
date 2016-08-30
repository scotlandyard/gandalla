import UIKit

class MNotifications
{
    let items:[MNotificationsItem]
    
    init()
    {
        let itemSocial:MNotificationsItemSocial = MNotificationsItemSocial()
        let itemPicture:MNotificationsItemPicture = MNotificationsItemPicture()
        let itemPower:MNotificationsItemPower = MNotificationsItemPower()
        let itemVideo:MNotificationsItemVideo = MNotificationsItemVideo()
        
        items = [
            itemSocial,
            itemPicture,
            itemPower,
            itemVideo
        ]
    }
}
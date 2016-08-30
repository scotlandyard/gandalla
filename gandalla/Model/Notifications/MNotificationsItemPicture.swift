import Foundation

class MNotificationsItemPicture:MNotificationsItem
{
    init()
    {
        let notificationType:FDatabaseModelNews.FDatabaseModelNewsType = FDatabaseModelNews.FDatabaseModelNewsType.Picture
        let title:String = NSLocalizedString("MNotificationsItemPicture_title", comment:"")
        
        super.init(title:title, notificationType:notificationType)
    }
}
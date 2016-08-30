import Foundation

class MNotificationsItemSocial:MNotificationsItem
{
    init()
    {
        let notificationType:FDatabaseModelNews.FDatabaseModelNewsType = FDatabaseModelNews.FDatabaseModelNewsType.Social
        let title:String = NSLocalizedString("MNotificationsItemSocial_title", comment:"")
        
        super.init(title:title, notificationType:notificationType)
    }
}
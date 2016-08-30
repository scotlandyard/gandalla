import Foundation

class MNotificationsItemPower:MNotificationsItem
{
    init()
    {
        let notificationType:FDatabaseModelNews.FDatabaseModelNewsType = FDatabaseModelNews.FDatabaseModelNewsType.Power
        let title:String = NSLocalizedString("MNotificationsItemPower_title", comment:"")
        
        super.init(title:title, notificationType:notificationType)
    }
}
import Foundation

class MNotificationsItemVideo:MNotificationsItem
{
    init()
    {
        let notificationType:FDatabaseModelNews.FDatabaseModelNewsType = FDatabaseModelNews.FDatabaseModelNewsType.Video
        let title:String = NSLocalizedString("MNotificationsItemVideo_title", comment:"")
        
        super.init(title:title, notificationType:notificationType)
    }
}
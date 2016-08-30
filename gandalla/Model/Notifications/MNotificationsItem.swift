import Foundation

class MNotificationsItem
{
    let title:String
    let notificationType:FDatabaseModelNews.FDatabaseModelNewsKey
    
    init(title:String, notificationType:FDatabaseModelNews.FDatabaseModelNewsKey)
    {
        self.title = title
        self.notificationType = notificationType
    }
}
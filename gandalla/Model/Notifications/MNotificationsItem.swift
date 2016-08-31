import Foundation

class MNotificationsItem
{
    let title:String
    let notificationType:FDatabaseModelNews.FDatabaseModelNewsType
    
    init(title:String, notificationType:FDatabaseModelNews.FDatabaseModelNewsType)
    {
        self.title = title
        self.notificationType = notificationType
    }
    
    //MARK: public
    
    func executeAction(controller:CNotifications)
    {
    }
}
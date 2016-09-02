import UIKit

class MNotificationsItem
{
    weak var controller:CNotifications?
    let title:String
    let notificationType:FDatabaseModelNews.FDatabaseModelNewsType
    
    init(title:String, notificationType:FDatabaseModelNews.FDatabaseModelNewsType)
    {
        self.title = title
        self.notificationType = notificationType
    }
    
    //MARK: private
    
    private func performRemove()
    {
        let reference:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.News
        let removeType:FDatabaseModelNews.FDatabaseModelNewsType = notificationType
        
        FMain.sharedInstance.database.listenParentOnce(
            reference)
        { [weak self] (snapshot) in
            
            let json:[String:AnyObject]? = snapshot.value as? [String:AnyObject]
            
            if json != nil
            {
                let rawKeys:[String] = Array(json!.keys)
                
                for rawKey:String in rawKeys
                {
                    let rawJson:[String:AnyObject] = json![rawKey] as! [String:AnyObject]
                    let fNews:FDatabaseModelNews = FDatabaseModelNews.withJson(rawJson)
                    
                    if fNews.newsType == removeType
                    {
                        FMain.sharedInstance.database.deleteChild(
                            reference,
                            childId:rawKey)
                    }
                }
            }
            
            self?.removeCompleted()
        }
    }
    
    private func removeCompleted()
    {
        dispatch_async(dispatch_get_main_queue())
        { [weak self] in
            
            self?.controller?.viewNotifications.hideLoading()
        }
    }
    
    //MARK: public
    
    func executeAction(controller:CNotifications)
    {
        self.controller = controller
        controller.viewNotifications.showLoading()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
         
            self?.performRemove()
        }
    }
}
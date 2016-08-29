import UIKit

class MCreateItemDetailPropertyItemActionSocialNotification:MCreateItemDetailPropertyItemAction
{
    init(gandallerId:String)
    {
        let title:String = NSLocalizedString("", comment:"")
        super.init(gandallerId:gandallerId, title:title)
    }
    
    override func performAction()
    {
        let news:FDatabaseModelNews = FDatabaseModelNewsSocial(gandallerId:gandallerId)
        let newsJson:[String:AnyObject] = news.modelJson()
        FMain.sharedInstance.database.createChild(
            FDatabase.FDatabaseReference.News,
            json:newsJson)
    }
}
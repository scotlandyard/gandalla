import UIKit

class MCreateItemDetailPropertyItemActionRemoveUnlessJoined:MCreateItemDetailPropertyItemAction
{
    init(gandallerId:String)
    {
        let title:String = NSLocalizedString("MCreateItemDetailPropertyItemActionRemoveUnlessJoined_title", comment:"")
        super.init(gandallerId:gandallerId, title:title)
    }
    
    override func performAction()
    {
//        let news:FDatabaseModelNews = FDatabaseModelNewsSocial(gandallerId:gandallerId)
//        let newsJson:[String:AnyObject] = news.modelJson()
//        FMain.sharedInstance.database.createChild(
//            FDatabase.FDatabaseReference.News,
//            json:newsJson)
    }
}
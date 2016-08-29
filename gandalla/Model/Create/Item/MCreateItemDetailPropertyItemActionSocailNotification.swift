import UIKit

class MCreateItemDetailPropertyItemActionSocialNotification:MCreateItemDetailPropertyItemAction
{
    init(gandallerId:String)
    {
        let title:String = NSLocalizedString("", comment:"")
        super.init(gandallerId:gandallerId, title:title)
    }
    
    //MARK: public
    
    override func action()
    {
        let alert:UIAlertController = UIAlertController(
            title:
            "",
            message:
            title,
            preferredStyle:UIAlertControllerStyle.ActionSheet)
        
        let actionDo:UIAlertAction = UIAlertAction(
            title:NSLocalizedString("MCreateItemDetailPropertyItemActionSocialNotification_actionDo", comment:""),
            style:
            UIAlertActionStyle.Default)
        { [weak self] (action) in
            
            if self != nil
            {
                let news:FDatabaseModelNews = FDatabaseModelNewsSocial(gandallerId:self!.gandallerId)
                let newsJson:[String:AnyObject] = news.modelJson()
                FMain.sharedInstance.database.createChild(
                    FDatabase.FDatabaseReference.News,
                    json:newsJson)
                
                let titleDone:String = NSLocalizedString("MCreateItemDetailPropertyItemNotify_done", comment:"")
                VMainAlert.Message(titleDone)
            }
        }
        
        let actionCancel:UIAlertAction = UIAlertAction(
            title:NSLocalizedString("MCreateItemDetailPropertyItemActionSocialNotification_actionCancel", comment:""),
            style:UIAlertActionStyle.Cancel,
            handler:nil)
        
        alert.addAction(actionDo)
        alert.addAction(actionCancel)
        controller.presentViewController(alert, animated:true, completion:nil)
    }
}
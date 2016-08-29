import UIKit

class MCreateItemDetailPropertyItemRemoveUnlessJoined:MCreateItemDetailPropertyItem
{
    let gandallerId:String
    let title:String
    
    init(gandallerId:String, title:String)
    {
        self.gandallerId = gandallerId
        self.title = title
        super.init()
    }
    
    override func config(controller:CCreateDetail, cell:VCreateDetailCell)
    {
        super.config(controller, cell:cell)
        
        let cellAction:VCreateDetailCellAction = cell as! VCreateDetailCellAction
        cellAction.button.setTitle(title, forState:UIControlState.Normal)
        cellAction.model = self
    }
    
    //MARK: public
    
    func notify()
    {
        let alert:UIAlertController = UIAlertController(
            title:
            NSLocalizedString("MCreateItemDetailPropertyItemNotify_title", comment:""),
            message:
            title,
            preferredStyle:UIAlertControllerStyle.ActionSheet)
        
        let actionNotify:UIAlertAction = UIAlertAction(
            title:NSLocalizedString("MCreateItemDetailPropertyItemNotify_notify", comment:""),
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
            title:NSLocalizedString("MCreateItemDetailPropertyItemNotify_cancel", comment:""),
            style:UIAlertActionStyle.Cancel,
            handler:nil)
        
        alert.addAction(actionNotify)
        alert.addAction(actionCancel)
        controller.presentViewController(alert, animated:true, completion:nil)
    }
}
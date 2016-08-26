import UIKit

class MCreateItemDetailPropertyItemNotify:MCreateItemDetailPropertyItem
{
    let gandallerId:String
    let title:String
    
    init(gandallerId:String)
    {
        self.gandallerId = gandallerId
        super.init()
    }
    
    override func config(controller:CCreateDetail, cell:VCreateDetailCell)
    {
        super.config(controller, cell:cell)
        
        let cellText:VCreateDetailCellText = cell as! VCreateDetailCellText
        cellText.field.delegate = self
        cellText.field.text = fVideo?.url
        cellText.field.placeholder = placeholder
    }
    
    //MARK: public
    
    func notify()
    {
        let alert:UIAlertController = UIAlertController(
            title:
            NSLocalizedString("MCreateItemDetailPropertyItemImage_deleteTitle", comment:""),
            message:
            NSLocalizedString("MCreateItemDetailPropertyItemImage_deleteMessage", comment:""),
            preferredStyle:UIAlertControllerStyle.ActionSheet)
        
        let actionDelete:UIAlertAction = UIAlertAction(
            title:NSLocalizedString("MCreateItemDetailPropertyItemImage_deleteDelete", comment:""),
            style:
            UIAlertActionStyle.Default)
        { [weak self] (action) in
            
            if self != nil
            {
                let news:FDatabaseModelNews = FDatabaseModelNewsVideo(gandallerId:self!.gandallerId, url:newUrl)
                let newsJson:[String:AnyObject] = news.modelJson()
                let newsId:String = FMain.sharedInstance.database.createChild(
                    FDatabase.FDatabaseReference.News,
                    json:newsJson)
            }
        }
        
        let actionCancel:UIAlertAction = UIAlertAction(
            title:NSLocalizedString("MCreateItemDetailPropertyItemImage_deleteCancel", comment:""),
            style:UIAlertActionStyle.Cancel,
            handler:nil)
        
        alert.addAction(actionDelete)
        alert.addAction(actionCancel)
        controller.presentViewController(alert, animated:true, completion:nil)
    }
}
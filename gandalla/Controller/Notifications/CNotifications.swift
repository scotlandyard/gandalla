import UIKit

class CNotifications:CMainController
{
    weak var viewNotifications:VNotifications!
    let model:MNotifications
    
    init()
    {
        model = MNotifications()
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func loadView()
    {
        let viewNotifications:VNotifications = VNotifications(controller:self)
        self.viewNotifications = viewNotifications
        view = viewNotifications
    }
    
    //MARK: public
    
    func selectedNotification(index:NSIndexPath)
    {
        let item:MNotificationsItem = model.items[index.item]
        
        let alert:UIAlertController = UIAlertController(
            title:NSLocalizedString("CNotifications_title", comment:""),
            message:
            item.title,
            preferredStyle:UIAlertControllerStyle.ActionSheet)
        
        let actionDo:UIAlertAction = UIAlertAction(
            title:NSLocalizedString("CNotifications_actionDo", comment:""),
            style:
            UIAlertActionStyle.Default)
        { [weak self] (action) in
            
            if self != nil
            {
                item.executeAction(self!)
            }
            
            let titleDone:String = NSLocalizedString("CNotifications_actionDone", comment:"")
            VMainAlert.Message(titleDone)
        }
        
        let actionCancel:UIAlertAction = UIAlertAction(
            title:NSLocalizedString("CNotifications_actionCancel", comment:""),
            style:UIAlertActionStyle.Cancel,
            handler:nil)
        
        alert.addAction(actionDo)
        alert.addAction(actionCancel)
        presentViewController(alert, animated:true, completion:nil)
    }
}
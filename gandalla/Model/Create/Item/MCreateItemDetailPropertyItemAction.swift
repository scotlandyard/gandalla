import UIKit

class MCreateItemDetailPropertyItemAction:MCreateItemDetailPropertyItem
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
    
    func performAction()
    {
        
    }
    
    func action()
    {
        let alert:UIAlertController = UIAlertController(
            title:NSLocalizedString("MCreateItemDetailPropertyItemAction_title", comment:""),
            message:
            title,
            preferredStyle:UIAlertControllerStyle.ActionSheet)
        
        let actionDo:UIAlertAction = UIAlertAction(
            title:NSLocalizedString("MCreateItemDetailPropertyItemAction_actionDo", comment:""),
            style:
            UIAlertActionStyle.Default)
        { [weak self] (action) in
            
            self?.performAction()
            
            let titleDone:String = NSLocalizedString("MCreateItemDetailPropertyItemAction_done", comment:"")
            VMainAlert.Message(titleDone)
        }
        
        let actionCancel:UIAlertAction = UIAlertAction(
            title:NSLocalizedString("MCreateItemDetailPropertyItemAction_actionCancel", comment:""),
            style:UIAlertActionStyle.Cancel,
            handler:nil)
        
        alert.addAction(actionDo)
        alert.addAction(actionCancel)
        controller.presentViewController(alert, animated:true, completion:nil)
    }
}
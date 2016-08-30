import UIKit

class MCreateItemDetailPropertyItemText:MCreateItemDetailPropertyItem
{
    let gandallerId:String
    let removeAble:Bool
    let placeholder:String
    var text:String
    
    init(gandallerId:String, placeholder:String, text:String, removeAble:Bool)
    {
        self.gandallerId = gandallerId
        self.placeholder = placeholder
        self.text = text
        self.removeAble = removeAble
        super.init()
    }
    
    override func config(controller:CCreateDetail, cell:VCreateDetailCell)
    {
        super.config(controller, cell:cell)
        
        let cellText:VCreateDetailCellText = cell as! VCreateDetailCellText
        cellText.field.resignFirstResponder()
        cellText.model = self
        cellText.field.text = text
        cellText.field.placeholder = placeholder
        cellText.removeAble(removeAble)
    }
    
    //MARK: public
    
    func changedText(text:String)
    {
        self.text = text
    }
    
    func performRemove()
    {
    }
    
    func remove()
    {
        let alert:UIAlertController = UIAlertController(
            title:
            NSLocalizedString("MCreateItemDetailPropertyItemText_title", comment:""),
            message:
            text,
            preferredStyle:UIAlertControllerStyle.ActionSheet)
        
        let actionDo:UIAlertAction = UIAlertAction(
            title:NSLocalizedString("MCreateItemDetailPropertyItemText_actionDo", comment:""),
            style:
            UIAlertActionStyle.Default)
        { [weak self] (action) in
            
            self?.performRemove()
            
            let titleDone:String = NSLocalizedString("MCreateItemDetailPropertyItemText_actionDone", comment:"")
            VMainAlert.Message(titleDone)
        }
        
        let actionCancel:UIAlertAction = UIAlertAction(
            title:NSLocalizedString("MCreateItemDetailPropertyItemText_actionCancel", comment:""),
            style:UIAlertActionStyle.Cancel,
            handler:nil)
        
        alert.addAction(actionDo)
        alert.addAction(actionCancel)
        controller.presentViewController(alert, animated:true, completion:nil)
    }
}
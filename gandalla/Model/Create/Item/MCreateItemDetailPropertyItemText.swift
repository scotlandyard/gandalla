import UIKit

class MCreateItemDetailPropertyItemText:MCreateItemDetailPropertyItem
{
    let placeholder:String
    
    init(placeholder:String)
    {
        self.placeholder = placeholder
        super.init()
    }
    
    override func config(controller:CCreateDetail, cell:VCreateDetailCell)
    {
        super.config(controller, cell:cell)
        
        let cellText:VCreateDetailCellText = cell as! VCreateDetailCellText
        cellText.field.resignFirstResponder()
        cellText.field.delegate = self
        cellText.field.text = name
        cellText.field.placeholder = placeholder
    }
    
    //MARK: field del
    
    func textFieldDidEndEditing(textField:UITextField)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            if self != nil
            {
                let name:String = textField.text!
                self!.name = name
                let gandallerId:String = self!.controller.model.gandaller.gandallerId
                let property:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.Name.rawValue
                
                FMain.sharedInstance.database.updateProperty(FDatabase.FDatabaseReference.Gandaller, childId:gandallerId, property:property, value:name)
            }
        }
    }
    
    func textFieldShouldReturn(textField:UITextField) -> Bool
    {
        textField.resignFirstResponder()
        
        return true
    }
}
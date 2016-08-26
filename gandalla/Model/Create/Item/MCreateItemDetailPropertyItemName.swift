import UIKit

class MCreateItemDetailPropertyItemName:MCreateItemDetailPropertyItem, UITextFieldDelegate
{
    var name:String
    let placeholder:String
    
    init(name:String)
    {
        self.name = name
        placeholder = ""
        super.init()
    }
    
    override func config(controller:CCreateDetail, cell:VCreateDetailCell)
    {
        super.config(controller, cell:cell)
        
        let cellText:VCreateDetailCellText = cell as! VCreateDetailCellText
        cellText.field.delegate = self
        cellText.field.text = name
        cellText.field.placeholder = placeholder
    }
    
    //MARK: field del
    
    func textFieldDidEndEditing(textField:UITextField)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
         
            let name:String = textField.text!
            
            if self != nil
            {
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
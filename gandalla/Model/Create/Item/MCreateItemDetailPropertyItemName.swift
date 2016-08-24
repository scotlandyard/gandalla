import UIKit

class MCreateItemDetailPropertyItemName:MCreateItemDetailPropertyItem, UITextFieldDelegate
{
    var name:String
    
    init(name:String)
    {
        self.name = name
    }
    
    override func config(controller:CCreateDetail, cell:VCreateDetailCell)
    {
        super.config(controller, cell:cell)
        
        let cellText:VCreateDetailCellText = cell as! VCreateDetailCellText
        cellText.field.delegate = self
        cellText.field.text = name
    }
    
    //MARK: field del
    
    
    func textFieldDidEndEditing(textField:UITextField)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
         
            let name:String = textField.text!
            
            if self != nil
            {
                let gandallerId:String = self!.controller.model.gandaller.gandallerId
                let property:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.Name.rawValue
                self?.name = name
                
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
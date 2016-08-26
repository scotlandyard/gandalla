
import UIKit

class MCreateItemDetailPropertyItemPower:MCreateItemDetailPropertyItem, UITextFieldDelegate
{
    let gandallerId:String
    weak var fPower:FDatabaseModelGandallerPower?
    
    init(gandallerId:String, fPower:FDatabaseModelGandallerPower)
    {
        self.gandallerId = gandallerId
        self.fPower = fPower
    }
    
    override func config(controller:CCreateDetail, cell:VCreateDetailCell)
    {
        super.config(controller, cell:cell)
        
        let cellText:VCreateDetailCellText = cell as! VCreateDetailCellText
        cellText.field.delegate = self
        cellText.field.text = fPower?.name
    }
    
    //MARK: field del
    
    func textFieldDidEndEditing(textField:UITextField)
    {
        let newName:String = textField.text!
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            if self != nil
            {
                if self!.fPower != nil
                {
                    let powerId:String = self!.fPower!.powerId!
                    let reference:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.Gandaller
                    let propertyPowers:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.Powers.rawValue
                    let propertyPowerName:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.PowerName.rawValue
                    let notificationId:String? = self!.fPower!.powerNotification
                    
                    FMain.sharedInstance.database.updateSubProperty(
                        reference,
                        childId:self!.gandallerId,
                        property:propertyPowers,
                        subChildId:powerId,
                        subPropertyId:propertyPowerName,
                        value:newName)
                    
                    if !newName.isEmpty
                    {
                        if notificationId == nil
                        {
                            
                        }
                        else
                        {
                            
                        }
                    }
                }
            }
            
            /*
            let name:String = textField.text!
            
            if self != nil
            {
                let gandallerId:String = self!.controller.model.gandaller.gandallerId
                let property:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.Name.rawValue
                self?.name = name
                
                FMain.sharedInstance.database.updateProperty(FDatabase.FDatabaseReference.Gandaller, childId:gandallerId, property:property, value:name)
            }*/
        }
    }
    
    func textFieldShouldReturn(textField:UITextField) -> Bool
    {
        textField.resignFirstResponder()
        
        return true
    }
}
import UIKit

class MCreateItemDetailPropertyItemPower:MCreateItemDetailPropertyItem, UITextFieldDelegate
{
    let gandallerId:String
    var fPower:FDatabaseModelGandallerPower?
    let placeholder:String
    
    init(gandallerId:String, fPower:FDatabaseModelGandallerPower)
    {
        self.gandallerId = gandallerId
        self.fPower = fPower
        placeholder = ""
        super.init()
    }
    
    override func config(controller:CCreateDetail, cell:VCreateDetailCell)
    {
        super.config(controller, cell:cell)
        
        let cellText:VCreateDetailCellText = cell as! VCreateDetailCellText
        cellText.field.delegate = self
        cellText.field.text = fPower?.name
        cellText.field.placeholder = placeholder
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
                            let propertyPowerNotification:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.PowerNotification.rawValue
                            let news:FDatabaseModelNews = FDatabaseModelNewsPower(gandallerId:self!.gandallerId, power:newName)
                            let newsJson:[String:AnyObject] = news.modelJson()
                            let newsId:String = FMain.sharedInstance.database.createChild(
                                FDatabase.FDatabaseReference.News,
                                json:newsJson)
                            self!.fPower!.powerNotification = newsId
                            
                            FMain.sharedInstance.database.updateSubProperty(
                                reference,
                                childId:self!.gandallerId,
                                property:propertyPowers,
                                subChildId:powerId,
                                subPropertyId:propertyPowerNotification,
                                value:newsId)
                        }
                        else
                        {
                            let referenceNotification:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.News
                            let propertyNotificationPower:String = FDatabaseModelNews.FDatabaseModelNewsKey.Power.rawValue
                            
                            FMain.sharedInstance.database.updateProperty(
                                referenceNotification,
                                childId:notificationId!,
                                property:propertyNotificationPower,
                                value:newName)
                        }
                    }
                }
            }
        }
    }
    
    func textFieldShouldReturn(textField:UITextField) -> Bool
    {
        textField.resignFirstResponder()
        
        return true
    }
}
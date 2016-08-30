import UIKit

class MCreateItemDetailPropertyItemTextPower:MCreateItemDetailPropertyItemText
{
    let fPower:FDatabaseModelGandallerPower
    private let kPlaceholder:String = ""
    private let kRemoveAble:Bool = true
    
    init(fPower:FDatabaseModelGandallerPower, gandallerId:String)
    {
        self.fPower = fPower
        super.init(gandallerId:gandallerId, placeholder:kPlaceholder, text:fPower.name, removeAble:kRemoveAble)
    }
    
    override func changedText(text:String)
    {
        super.changedText(text)
        
        if fPower != nil
        {
            fPower!.name = text
            let powerId:String = fPower!.powerId!
            let reference:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.Gandaller
            let propertyPowers:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.Powers.rawValue
            let propertyPowerName:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.PowerName.rawValue
            let notificationId:String? = fPower!.powerNotification
            
            FMain.sharedInstance.database.updateSubProperty(
                reference,
                childId:gandallerId,
                property:propertyPowers,
                subChildId:powerId,
                subPropertyId:propertyPowerName,
                value:text)
            
            if notificationId == nil
            {
                let propertyPowerNotification:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.PowerNotification.rawValue
                let news:FDatabaseModelNews = FDatabaseModelNewsPower(gandallerId:gandallerId, power:text)
                let newsJson:[String:AnyObject] = news.modelJson()
                let newsId:String = FMain.sharedInstance.database.createChild(
                    FDatabase.FDatabaseReference.News,
                    json:newsJson)
                fPower!.powerNotification = newsId
                
                FMain.sharedInstance.database.updateSubProperty(
                    reference,
                    childId:gandallerId,
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
                    value:text)
            }
        }
    }
    
    override func performRemove()
    {
        if fPower != nil
        {
            controller.removePower(fPower!)
        }
    }
}
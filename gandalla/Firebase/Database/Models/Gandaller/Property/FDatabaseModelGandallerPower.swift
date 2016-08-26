import Foundation

class FDatabaseModelGandallerPower
{
    let name:String
    var powerNotification:String?
    var powerId:String?
    
    init()
    {
        name = ""
    }
    
    init(json:[String:AnyObject], powerId:String)
    {
        let rawPowerName:String = json[FDatabaseModelGandaller.FDatabaseModelGandallerKey.PowerName.rawValue] as! String
        let rawPowerNotification:String? = json[FDatabaseModelGandaller.FDatabaseModelGandallerKey.PowerNotification.rawValue] as? String
        
        self.powerId = powerId
        name = rawPowerName
        powerNotification = rawPowerNotification
    }
    
    //MARK: public
    
    func modelJson() -> [String:AnyObject]
    {
        var json:[String:AnyObject] = [
            FDatabaseModelGandaller.FDatabaseModelGandallerKey.PowerName.rawValue:name]
        
        if powerNotification != nil
        {
            json[FDatabaseModelGandaller.FDatabaseModelGandallerKey.PowerNotification.rawValue] = powerNotification!
        }
        
        return json
    }
}
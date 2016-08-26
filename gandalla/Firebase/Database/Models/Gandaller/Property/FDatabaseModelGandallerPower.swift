import Foundation

class FDatabaseModelGandallerPower
{
    let name:String
    var powerNotification:String?
    
    init()
    {
        name = ""
    }
    
    init(json:[String:AnyObject])
    {
        let rawPowerName:String = json[FDatabaseModelGandaller.FDatabaseModelGandallerKey.PowerName.rawValue] as! String
        let rawPowerNotification:String? = json[FDatabaseModelGandaller.FDatabaseModelGandallerKey.PowerNotification.rawValue] as? String
        
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
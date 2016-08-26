import Foundation

class FDatabaseModelGandallerPower
{
    let name:String
    var powerNotification:String?
    
    init()
    {
        name = ""
    }
    
    //MARK: public
    
    func modelJson() -> [String:AnyObject]
    {
        var json:[String:AnyObject] = [
            FDatabaseModelGandaller.FDatabaseModelGandallerKey.ImageStatus.rawValue:status.rawValue]
        
        if imageNotification != nil
        {
            json[FDatabaseModelGandaller.FDatabaseModelGandallerKey.ImageNotification.rawValue] = imageNotification!
        }
        
        return json
    }
}
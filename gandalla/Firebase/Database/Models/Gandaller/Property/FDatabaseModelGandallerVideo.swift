import Foundation

class FDatabaseModelGandallerVideo
{
    let url:String
    var videoNotification:String?
    var videoId:String?
    
    init()
    {
        url = ""
    }
    
    init(json:[String:AnyObject], videoId:String)
    {
        let rawVideoUrl:String = json[FDatabaseModelGandaller.FDatabaseModelGandallerKey.VideoUrl.rawValue] as! String
        let rawPowerNotification:String? = json[FDatabaseModelGandaller.FDatabaseModelGandallerKey.VideoNotification.rawValue] as? String
        
        self.videoId = videoId
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
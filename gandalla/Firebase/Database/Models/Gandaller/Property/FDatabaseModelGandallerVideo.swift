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
        let rawVideoNotification:String? = json[FDatabaseModelGandaller.FDatabaseModelGandallerKey.VideoNotification.rawValue] as? String
        
        self.videoId = videoId
        url = rawVideoUrl
        videoNotification = rawVideoNotification
    }
    
    //MARK: public
    
    func modelJson() -> [String:AnyObject]
    {
        var json:[String:AnyObject] = [
            FDatabaseModelGandaller.FDatabaseModelGandallerKey.VideoUrl.rawValue:url]
        
        if videoNotification != nil
        {
            json[FDatabaseModelGandaller.FDatabaseModelGandallerKey.VideoNotification.rawValue] = videoNotification!
        }
        
        return json
    }
}
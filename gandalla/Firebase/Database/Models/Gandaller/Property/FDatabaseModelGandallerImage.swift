import Foundation

class FDatabaseModelGandallerImage
{
    enum FDatabaseModelGandallerImageStatus:Int
    {
        case Waiting
        case Ready
    }
    
    let imageid:String
    let status:FDatabaseModelGandallerImageStatus
    
    class func withJson(json:[String:AnyObject]) -> FDatabaseModelGandallerImage
    {
        let image:FDatabaseModelGandallerImage
        let imageStatusKey:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.ImageStatus.rawValue
        let rawStatus:Int = json[imageStatusKey] as! Int
        let status:FDatabaseModelGandallerImageStatus = FDatabaseModelGandallerImageStatus(rawValue:rawStatus)!
        
        switch status
        {
            case FDatabaseModelGandallerImageStatus.Waiting:
                
                image = FDatabaseModelGandallerImageWaiting(json:json)
                
                break
                
            case FDatabaseModelGandallerImageStatus.Ready:
                
                image = FDatabaseModelGandallerImageReady(json:json)
                
                break
        }
        
        return image
    }
    
    init(imageid:String, status:FDatabaseModelGandallerImageStatus)
    {
        self.imageid = imageid
        self.status = status
    }
    
    init(json:[String:AnyObject], status:FDatabaseModelGandallerImageStatus)
    {
        self.imageid = imageid
        self.status = status
    }
}
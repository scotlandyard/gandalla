import Foundation

class FDatabaseModelGandallerImage
{
    enum FDatabaseModelGandallerImageStatus:Int
    {
        case Waiting
        case Ready
    }
    
    var imageId:String
    var imageNotification:String?
    let status:FDatabaseModelGandallerImageStatus
    
    class func withJson(json:[String:AnyObject], imageId:String) -> FDatabaseModelGandallerImage
    {
        let image:FDatabaseModelGandallerImage
        let imageStatusKey:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.ImageStatus.rawValue
        let imageNotificationKey:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.ImageNotification.rawValue
        let rawStatus:Int = json[imageStatusKey] as! Int
        let rawImageNotification:String? = json[imageNotificationKey] as? String
        let status:FDatabaseModelGandallerImageStatus = FDatabaseModelGandallerImageStatus(rawValue:rawStatus)!
        
        switch status
        {
            case FDatabaseModelGandallerImageStatus.Waiting:
                
                image = FDatabaseModelGandallerImageWaiting(imageId:imageId)
                
                break
                
            case FDatabaseModelGandallerImageStatus.Ready:
                
                image = FDatabaseModelGandallerImageReady(imageId:imageId)
                
                break
        }
        
        image.imageNotification = rawImageNotification
        
        return image
    }
    
    init(imageId:String, status:FDatabaseModelGandallerImageStatus)
    {
        self.imageId = imageId
        self.status = status
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
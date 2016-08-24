import Foundation

class FDatabaseModelGandallerImage
{
    enum FDatabaseModelGandallerImageStatus:Int
    {
        case Waiting
        case Ready
    }
    
    let imageId:String
    let status:FDatabaseModelGandallerImageStatus
    
    class func withJson(json:[String:AnyObject], imageId:String) -> FDatabaseModelGandallerImage
    {
        let image:FDatabaseModelGandallerImage
        let imageStatusKey:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.ImageStatus.rawValue
        let rawStatus:Int = json[imageStatusKey] as! Int
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
        let json:[String:AnyObject] = [
            FDatabaseModelGandaller.FDatabaseModelGandallerKey.ImageStatus.rawValue:status.rawValue]
        
        return json
    }
}
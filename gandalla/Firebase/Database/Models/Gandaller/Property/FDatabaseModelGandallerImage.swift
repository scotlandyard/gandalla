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
        let rawStatus:Int = json[FDatabaseModelGandallerKey.Status.rawValue] as! Int
        let status:FDatabaseModelGandallerStatus = FDatabaseModelGandallerStatus(rawValue:rawStatus)!
        
        switch status
        {
        case FDatabaseModelGandallerStatus.Active:
            
            gandaller = FDatabaseModelGandallerActive(json:json)
            
            break
            
        case FDatabaseModelGandallerStatus.Paused:
            
            gandaller = FDatabaseModelGandallerPaused(json:json)
            
            break
        }
        
        return gandaller
    }
    
    init(imageid:String, status:FDatabaseModelGandallerImageStatus)
    {
        self.imageid = imageid
        self.status = status
    }
}
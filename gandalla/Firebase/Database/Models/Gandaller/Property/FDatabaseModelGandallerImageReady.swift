import Foundation

class FDatabaseModelGandallerImageReady:FDatabaseModelGandallerImage
{
    init(imageid:String)
    {
        let status:FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus = FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus.Ready
        
        super.init(imageid:imageid, status:status)
    }
    
    init(json:[String:AnyObject])
    {
        let status:FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus = FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus.Ready
        
        super.init(json:json, status:status)
    }
}
import Foundation

class FDatabaseModelGandallerImageWaiting:FDatabaseModelGandallerImage
{
    init(imageid:String)
    {
        let status:FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus = FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus.Waiting
        
        super.init(imageid:imageid, status:status)
    }
    
    init(json:[String:AnyObject])
    {
        let status:FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus = FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus.Waiting
        
        super.init(json:json, status:status)
    }
}
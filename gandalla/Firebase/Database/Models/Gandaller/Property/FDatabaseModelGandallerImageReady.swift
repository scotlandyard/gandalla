import Foundation

class FDatabaseModelGandallerImageReady:FDatabaseModelGandallerImage
{
    init(imageid:String)
    {
        let status:FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus = FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus.Ready
        
        super.init(imageid:imageid, status:status)
    }
}
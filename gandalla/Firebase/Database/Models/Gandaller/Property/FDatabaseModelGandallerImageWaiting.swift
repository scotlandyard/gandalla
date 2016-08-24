import Foundation

class FDatabaseModelGandallerImageWaiting:FDatabaseModelGandallerImage
{
    init(imageid:String)
    {
        let status:FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus = FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus.Waiting
        
        super.init(imageid:imageid, status:status)
    }
}
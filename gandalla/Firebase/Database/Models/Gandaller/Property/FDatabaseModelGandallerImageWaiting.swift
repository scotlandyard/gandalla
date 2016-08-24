import Foundation

class FDatabaseModelGandallerImageWaiting:FDatabaseModelGandallerImage
{
    init(imageId:String)
    {
        let status:FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus = FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus.Waiting
        
        super.init(imageId:imageId, status:status)
    }
}
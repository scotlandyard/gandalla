import Foundation

class FDatabaseModelGandallerImageReady:FDatabaseModelGandallerImage
{
    init(imageId:String)
    {
        let status:FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus = FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus.Ready
        
        super.init(imageId:imageId, status:status)
    }
}
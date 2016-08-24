import Foundation

class FDatabaseModelGandallerImageWaiting:FDatabaseModelGandallerImage
{
    init()
    {
        let status:FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus = FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus.Waiting
        
        super.init(imageId:nil, status:status)
    }
    
    init(imageId:String)
    {
        let status:FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus = FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus.Waiting
        
        super.init(imageId:imageId, status:status)
    }
}
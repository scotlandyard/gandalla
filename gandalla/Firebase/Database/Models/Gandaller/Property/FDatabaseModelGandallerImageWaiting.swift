import Foundation

class FDatabaseModelGandallerImageWaiting:FDatabaseModelGandallerImage
{
    private let kImageId:String = ""
    
    init()
    {
        let status:FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus = FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus.Waiting
        
        super.init(imageId:kImageId, status:status)
    }
    
    init(imageId:String)
    {
        let status:FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus = FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus.Waiting
        
        super.init(imageId:imageId, status:status)
    }
}
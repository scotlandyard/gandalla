import Foundation

class FDatabaseModelGandallerImage
{
    enum FDatabaseModelGandallerImageStatus:Int
    {
        case Waiting
        case Ready
    }
    
    let imageid:String
    let status:FDatabaseModelGandallerImage
    
    init(imageid:String, status:FDatabaseModelGandallerImage)
    {
        self.imageid = imageid
        self.status = status
    }
}
import Foundation

class FDatabaseModelGandallerImage
{
    enum FDatabaseModelGandallerImageStatus:Int
    {
        case Waiting
        case Ready
    }
    
    let imageid:String
    
    init(imageid:String)
    {
        self.imageid = imageid
    }
}
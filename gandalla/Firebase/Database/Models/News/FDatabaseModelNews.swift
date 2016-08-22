import Foundation

class FDatabaseModelNews:FDatabaseModel
{
    @objc enum FDatabaseModelNewsType:Int
    {
        case Joined
        case Picture
        case Power
        case Video
        case Social
    }
    
    let created:NSTimeInterval
    let kKeyCreated:String = "created"
    
    init()
    {
        created = NSDate().timeIntervalSince1970
    }
    
    //MARK: public
    
    func modelJson() -> [String:AnyObject]
    {
        let dict:[String:AnyObject] = [
            kKeyCreated:created
        ]
        
        return dict
    }
}
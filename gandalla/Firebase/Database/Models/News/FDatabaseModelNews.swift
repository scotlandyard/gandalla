import Foundation

class FDatabaseModelNews:FDatabaseModel
{
    enum FDatabaseModelNewsType:Int
    {
        case Joined
        case Picture
        case Power
        case Video
        case Social
    }
    
    enum FDatabaseModelNewsKey:String
    {
        case Type = "type"
        case GandallerId = "gandaller_id"
        case Created = "created"
    }
    
    let type:FDatabaseModelNewsType
    let gandallerId:String
    let created:NSTimeInterval
    
    init(type:FDatabaseModelNewsType, gandallerId:String)
    {
        self.type = type
        self.gandallerId = gandallerId
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
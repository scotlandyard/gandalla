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
        case NewsType = "news_type"
        case GandallerId = "gandaller_id"
        case Created = "created"
    }
    
    let newsType:FDatabaseModelNewsType
    let gandallerId:String
    let created:NSTimeInterval
    
    init(newsType:FDatabaseModelNewsType, gandallerId:String)
    {
        self.newsType = newsType
        self.gandallerId = gandallerId
        created = NSDate().timeIntervalSince1970
    }
    
    //MARK: public
    
    func modelJson() -> [String:AnyObject]
    {
        let dict:[String:AnyObject] = [
            FDatabaseModelNewsKey.NewsType.rawValue:newsType.rawValue,
            FDatabaseModelNewsKey.GandallerId.rawValue:gandallerId,
            FDatabaseModelNewsKey.Created.rawValue:created
        ]
        
        return dict
    }
}
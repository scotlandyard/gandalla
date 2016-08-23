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
        case PictureId = "picture_id"
        case Power = "power"
        case Url = "url"
    }
    
    let newsType:FDatabaseModelNewsType
    let gandallerId:String
    let created:NSTimeInterval
    
    class func withJson(json:[String:AnyObject]) -> FDatabaseModelNews
    {
        let news:FDatabaseModelNews
        let rawNewsType:Int = json[FDatabaseModelNewsKey.NewsType.rawValue] as! Int
        let newsType:FDatabaseModelNewsType = FDatabaseModelNewsType(rawValue:rawNewsType)!
        
        switch newsType
        {
            case FDatabaseModelNewsType.Joined:
                
                news = FDatabaseModelNewsJoined(json:json)
                
                break
            
            case FDatabaseModelNewsType.Picture:
                
                news = FDatabaseModelNewsPicture(json:json)
                
                break
                
            case FDatabaseModelNewsType.Power:
                
                news = FDatabaseModelNewsPower(json:json)
                
                break
                
            case FDatabaseModelNewsType.Social:
                
                news = FDatabaseModelNewsSocial(json:json)
                
                break
                
            case FDatabaseModelNewsType.Video:
                
                news = FDatabaseModelNewsVideo(json:json)
                
                break
        }
        
        return news
    }
    
    init(newsType:FDatabaseModelNewsType, gandallerId:String)
    {
        self.newsType = newsType
        self.gandallerId = gandallerId
        created = NSDate().timeIntervalSince1970
    }
    
    init(newsType:FDatabaseModelNewsType, json:[String:AnyObject])
    {
        
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
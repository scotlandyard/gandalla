import Foundation

class FDatabaseModelGandaller:FDatabaseModel
{
    enum FDatabaseModelGandallerStatus:Int
    {
        case Paused
        case Active
    }
    
    enum FDatabaseModelGandallerKey:String
    {
        case Status = "status"
        case Created = "created"
        case Name = "name"
        case Images = "images"
        case Powers = "powers"
        case Videos = "videos"
        case Social = "social"
    }
    
    let status:FDatabaseModelGandallerStatus
    let name:String
    let created:NSTimeInterval
    let social
    var images:[]
    var powers:[]
    var videos:[]
    
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
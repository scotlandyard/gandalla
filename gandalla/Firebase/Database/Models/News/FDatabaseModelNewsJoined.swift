import Foundation

class FDatabaseModelNewsJoined:FDatabaseModelNews
{
    init(gandallerId:String)
    {
        let newsType:FDatabaseModelNewsType = FDatabaseModelNewsType.Joined
        super.init(newsType:newsType, gandallerId:gandallerId)
    }
    
    init(json:[String:AnyObject])
    {
        let newsType:FDatabaseModelNewsType = FDatabaseModelNewsType.Joined
        super.init(newsType:newsType, json:json)
    }
}
import Foundation

class FDatabaseModelNewsSocial:FDatabaseModelNews
{
    init(gandallerId:String)
    {
        let newsType:FDatabaseModelNewsType = FDatabaseModelNewsType.Social
        super.init(newsType:newsType, gandallerId:gandallerId)
    }
    
    init(json:[String:AnyObject])
    {
        let newsType:FDatabaseModelNewsType = FDatabaseModelNewsType.Social
        super.init(newsType:newsType, json:json)
    }
}
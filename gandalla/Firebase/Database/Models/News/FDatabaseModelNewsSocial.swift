import Foundation

class FDatabaseModelNewsSocial:FDatabaseModelNews
{
    init(gandallerId:String)
    {
        let newsType:FDatabaseModelNewsType = FDatabaseModelNewsType.Social
        super.init(newsType:newsType, gandallerId:gandallerId)
    }
}
import Foundation

class FDatabaseModelNewsJoined:FDatabaseModelNews
{
    init(gandallerId:String)
    {
        let newsType:FDatabaseModelNewsType = FDatabaseModelNewsType.Joined
        super.init(newsType:newsType, gandallerId:gandallerId)
    }
}
import Foundation

class FDatabaseModelNewsPicture:FDatabaseModelNews
{
    init(gandallerId:String)
    {
        let newsType:FDatabaseModelNewsType = FDatabaseModelNewsType.Picture
        super.init(newsType:newsType, gandallerId:gandallerId)
    }
}
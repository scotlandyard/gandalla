import Foundation

class FDatabaseModelNewsVideo:FDatabaseModelNews
{
    let url:String
    
    init(gandallerId:String, url:String)
    {
        let newsType:FDatabaseModelNewsType = FDatabaseModelNewsType.Video
        self.url = url
        super.init(newsType:newsType, gandallerId:gandallerId)
    }
}
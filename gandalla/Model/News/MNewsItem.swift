import Foundation

class MNewsItem
{
    let newsId:String
    let fModel:FDatabaseModelNews
    
    init(newsId:String, fModel:FDatabaseModelNews)
    {
        self.newsId = newsId
        self.fModel = fModel
    }
}
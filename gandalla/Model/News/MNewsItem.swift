import Foundation

class MNewsItem
{
    let newsId:String
    let fModel:FDatabaseModelNews
//    weak var fModel:FDatabaseModelGandaller!
    
    init(newsId:String, fModel:FDatabaseModelNews)
    {
        self.newsId = newsId
        self.fModel = fModel
        
    }
}
import Foundation

class MNewsItem
{
    let newsId:String
    let fModel:FDatabaseModelNews
    let date:String
    weak var gandaller:MGandallerItem!
    
    init(newsId:String, fModel:FDatabaseModelNews, date:String, gandaller:MGandallerItem)
    {
        self.newsId = newsId
        self.fModel = fModel
        self.date = date
        self.gandaller = gandaller
    }
}
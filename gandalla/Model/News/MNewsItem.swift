import Foundation

class MNewsItem
{
    let newsId:String
    let fModel:FDatabaseModelNews
    let date:String
    weak var gandaller:MGandallerItem!
    
    init(newsId:String, fModel:FDatabaseModelNews, date:String)
    {
        self.newsId = newsId
        self.fModel = fModel
        self.date = date
        
        let gandallerId:String = fModel.gandallerId
        gandaller = MGandaller.sharedInstance.items[gandallerId]
    }
}
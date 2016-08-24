import Foundation

class MNewsItem
{
    let newsId:String
    let fModel:FDatabaseModelNews
    weak var gandaller:MGandallerItem!
    
    init(newsId:String, fModel:FDatabaseModelNews)
    {
        self.newsId = newsId
        self.fModel = fModel
        
        let gandallerId:String = fModel.gandallerId
        gandaller = MGandaller.sharedInstance.items[gandallerId]
    }
}
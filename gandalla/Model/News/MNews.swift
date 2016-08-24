import Foundation

class MNews
{
    var items:[MNewsItem]
    var lastTimestamp:NSTimeInterval
    private let kDateFormat:String = "dd/MM/yy"
    private let dateFormatter:NSDateFormatter
    
    init()
    {
        items = []
        lastTimestamp = 0
        dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = kDateFormat
    }
    
    //MARK: public
    
    func addNews(newsId:String, fModel:FDatabaseModelNews) -> NSIndexPath?
    {
        var indexPath:NSIndexPath? = nil
        let created:NSTimeInterval = fModel.created
        
        if created > lastTimestamp
        {
            let gandallerId:String = fModel.gandallerId
            let gandaller:MGandallerItem = MGandaller.sharedInstance.items[gandallerId]!
            
            if gandaller.fModel.status == FDatabaseModelGandaller.FDatabaseModelGandallerStatus.Active
            {
                let date:NSDate = NSDate(timeIntervalSince1970:created)
                let dateString:String = dateFormatter.stringFromDate(date)
                let countItems:Int = items.count
                var addIndex:Int = countItems
                
                for index:Int in 0 ..< countItems
                {
                    let item:MNewsItem = items[index]
                    
                    if item.fModel.created < created
                    {
                        addIndex = index
                        
                        break
                    }
                }
                
                let newItem:MNewsItem = MNewsItem(newsId:newsId, fModel:fModel, date:dateString, gandaller:gandaller)
                items.insert(newItem, atIndex:addIndex)
                indexPath = NSIndexPath(forItem:addIndex, inSection:0)
                
                lastTimestamp = created
            }
        }
        
        return indexPath
    }
}
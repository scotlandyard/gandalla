import Foundation

class MNews
{
    var items:[MNewsItem]
    var lastTimestamp:NSTimeInterval
    
    init()
    {
        items = []
        lastTimestamp = 0
    }
    
    //MARK: public
    
    func addNews(newsId:String, fModel:FDatabaseModelNews) -> NSIndexPath?
    {
        var indexPath:NSIndexPath? = nil
        let created:NSTimeInterval = fModel.created
        
        if created > lastTimestamp
        {
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
            
            let newItem:MNewsItem = MNewsItem(newsId:newsId, fModel:fModel)
            items.insert(newItem, atIndex:addIndex)
            indexPath = NSIndexPath(forItem:addIndex, inSection:0)
            
            lastTimestamp = created
        }
        
        return indexPath
    }
}
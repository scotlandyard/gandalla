import Foundation

class MChampions
{
    let items:[MChampionsItem]
    
    init(json:[String:AnyObject])
    {
        var items:[MChampionsItem] = []
        
        let countKey:String = FDatabaseModelLike.FDatabaseModelLikeKey.Count.rawValue
        let jsonKeys:[String] = Array(json.keys)
        
        for jsonKey:String in jsonKeys
        {
            let jsonItem:[String:AnyObject] = json[jsonKey] as! [String:AnyObject]
            let count:Int = jsonItem[countKey] as! Int
            let item:MChampionsItem = MChampionsItem(gandallerId:jsonKey, count:count)
            items.append(item)
        }
        
        self.items = items
    }
}
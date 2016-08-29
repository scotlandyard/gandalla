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
            let modelGandaller:MGandallerItem? = MGandaller.sharedInstance.items[jsonKey]
            
            if modelGandaller != nil
            {
                let item:MChampionsItem = MChampionsItem(modelGandaller:modelGandaller!, count:count)
                items.append(item)
            }
        }
        
        items.sortInPlace
        { (itemA, itemB) -> Bool in
            
            let before:Bool
            let countA:Int = itemA.count
            let countB:Int = itemB.count
            
            if countA > countB
            {
                before = true
            }
            else if countA < countB
            {
                before = false
            }
            else
            {
                if itemA.modelGandaller.fModel.created <= itemB.modelGandaller.fModel.created
                {
                    before = true
                }
                else
                {
                    before = false
                }
            }
            
            return before
        }
        
        self.items = items
    }
}
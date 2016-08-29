import Foundation

class MLiked
{
    let items:[MLikedItem]
    
    init()
    {
        var items:[MLikedItem] = []
        let dbLikedList:[DGandallaGandaller] = MUser.sharedInstance.dbUser.likedGandaller
        
        for dbLiked:DGandallaGandaller in dbLikedList
        {
            let gandallerId:String = dbLiked.gandallerId
            let modelGandaller:MGandallerItem? = MGandaller.sharedInstance.items[gandallerId]
            
            if modelGandaller != nil
            {
                let created:NSTimeInterval = dbLiked.created
                let item:MLikedItem = MLikedItem(modelGandaller:modelGandaller!, created:created)
                items.append(item)
            }
        }
        
        items.sortInPlace()
        { (itemA, itemB) -> Bool in
            
            let before:Bool
            let createdA:NSTimeInterval = itemA.created
            let createdB:NSTimeInterval = itemB.created
            
            if createdA <= createdB
            {
                before = true
            }
            else
            {
                before = false
            }
            
            return before
        }
        
        self.items = items
    }
}
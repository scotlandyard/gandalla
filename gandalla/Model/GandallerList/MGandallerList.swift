import Foundation

class MGandallerList
{
    var items:[MGandallerListItem]
    
    init()
    {
        items = []
    }
    
    //MARK: public
    
    func load()
    {
        var newItems:[MGandallerListItem] = []
        let gandallersKeys:[String] = Array(MGandaller.sharedInstance.items.keys)
        
        for gandallerKey:String in gandallersKeys
        {
            let gandaller:MGandallerItem = MGandaller.sharedInstance.items[gandallerKey]!
            
            if gandaller.fModel.started
            {
                if gandaller.fModel.status == FDatabaseModelGandaller.FDatabaseModelGandallerStatus.Active
                {
                    let newItem:MGandallerListItem = MGandallerListItem(modelGandaller:gandaller)
                    newItems.append(newItem)
                }
            }
        }
        
        newItems.sortInPlace
        { (itemA, itemB) -> Bool in
            
            let before:Bool
            let nameA:String = itemA.modelGandaller.fModel.name
            let nameB:String = itemB.modelGandaller.fModel.name
            let result:NSComparisonResult = nameA.compare(nameB)
            
            switch result
            {
                case NSComparisonResult.OrderedAscending, NSComparisonResult.OrderedSame:
                
                    before = true
                    
                    break
                
                case NSComparisonResult.OrderedDescending:
                
                    before = false
                    
                    break
            }
            
            return before
        }
        
        items = newItems
    }
}
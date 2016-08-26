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
        let gandallersKeys:[String] = Array(MGandaller.sharedInstance.items.keys)
        
        for gandallerKey:String in gandallersKeys
        {
            let gandaller:MGandallerItem = MGandaller.sharedInstance.items[gandallerKey]
            
            if gandaller.fModel.started
        }
    }
}
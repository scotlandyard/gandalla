import Foundation

class MGandaller
{
    static let sharedInstance = MGandaller()
    private(set) var items:[MGandallerItem]
    
    private init()
    {
        items = []
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        {
            self.loadGandallers()
        }
    }
    
    //MARK: private
    
    private func loadGandallers()
    {
        FMain.sharedInstance.database.listenParent(FDatabase.FDatabaseReference.Gandaller)
        { (snapshot) in
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
            {
                let json:[String:[String:AnyObject]]? = snapshot.value as? [String:[String:AnyObject]]
                
                if json != nil
                {
                    self.gandallersReceived(json!)
                }
            }
        }
    }
    
    private func gandallersReceived(json:[String:[String:AnyObject]])
    {
        var newItems:[MGandallerItem] = items.map
        { (gandaller) -> MGandallerItem in
            
            let copy:MGandallerItem = gandaller.copy()
            
            return copy
        }
        
        let keys:[String] = Array(json.keys)
        
        for key:String in keys
        {
            let inJson:[String:AnyObject] = json[key]!
            let fGandaller:FDatabaseModelGandaller = FDatabaseModelGandaller.withJson(inJson)
            var inGandaller:MGandallerItem?
            
            for gandaller:MGandallerItem in newItems
            {
                if gandaller.gandallerId == key
                {
                    inGandaller = gandaller
                    
                    break
                }
            }
            
            if inGandaller == nil
            {
                let newGandaller:MGandallerItem = MGandallerItem(gandallerId:key, fModel:fGandaller)
                newItems.append(newGandaller)
            }
            else
            {
                inGandaller!.fModel = fGandaller
            }
        }
        
        dispatch_async(dispatch_get_main_queue())
        {
            self.gandallersUpdated(newItems)
        }
    }
    
    private func gandallersUpdated(newGandallers:[MGandallerItem])
    {
        items = newGandallers
        
        NSNotificationCenter.defaultCenter().postNotificationName(NSNotification.NSNotificationName.GandallersLoaded.rawValue, object:nil)
    }
}
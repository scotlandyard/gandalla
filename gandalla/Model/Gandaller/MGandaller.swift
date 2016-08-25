import Foundation

class MGandaller
{
    static let sharedInstance = MGandaller()
    private(set) var items:[String:MGandallerItem]
    
    private init()
    {
        items = [:]
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
        let keys:[String] = Array(json.keys)
        
        for key:String in keys
        {
            let inJson:[String:AnyObject] = json[key]!
            let fGandaller:FDatabaseModelGandaller = FDatabaseModelGandaller.withJson(inJson)
            let inGandaller:MGandallerItem? = items[key]
            
            if inGandaller == nil
            {
                let newGandaller:MGandallerItem = MGandallerItem(gandallerId:key, fModel:fGandaller)
                items[key] = newGandaller
            }
            else
            {
                inGandaller!.update(fGandaller)
            }
        }
        
        dispatch_async(dispatch_get_main_queue())
        {
            self.gandallersUpdated()
        }
    }
    
    private func gandallersUpdated()
    {
        NSNotificationCenter.defaultCenter().postNotificationName(NSNotification.NSNotificationName.GandallersLoaded.rawValue, object:nil)
    }
    
    //MARK: public
    
    func load()
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        {
            self.loadGandallers()
        }
    }
}
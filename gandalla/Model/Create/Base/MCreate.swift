import Foundation
import CoreLocation

class MCreate
{
    private(set) var items:[MCreateItem]
    
    init()
    {
        items = []
    }
    
    //MARK: public
    
    func update(json:[String:[String:AnyObject]])
    {
        var items:[MCreateItem] = []
        let keys:[String] = Array(json.keys)
        
        for key:String in keys
        {
            let inJson:[String:AnyObject] = json[key]!
            let fGandaller:FDatabaseModelGandaller = FDatabaseModelGandaller.withJson(inJson)
            let item:MCreateItem = MCreateItem(gandallerId:key, fModel:fGandaller)
            
            items.append(item)
        }
        
        self.items = items
    }
    
    func clear()
    {
        items = []
    }
}
import Foundation
import CoreLocation

class MCreate
{
    var items:[MCreateItem]
    
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
            let fGandaller:FDatabaseModelGandaller = 
            let item:MCreateItem = MCreateItem(gandallerId:key, fModel:inj)
        }
        
        self.items = items
    }
}
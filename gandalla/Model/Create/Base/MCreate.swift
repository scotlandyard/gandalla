import Foundation
import CoreLocation

class MCreate
{
    private(set) var items:[MCreateItem]
    
    init()
    {
        items = []
        update()
    }
    
    //MARK: public
    
    func update()
    {
        var items:[MCreateItem] = []
        let gandallerItems:[MGandallerItem] = MGandaller.sharedInstance.items
        
        for item:MGandallerItem in gandallerItems
        {
            let item:MCreateItem = MCreateItem(gandaller:item)
            
            items.append(item)
        }
        
        self.items = items
    }
}
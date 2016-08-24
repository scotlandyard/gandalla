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
        let gandallerItems:[MGandallerItem] = Array(MGandaller.sharedInstance.items.values)
        
        for item:MGandallerItem in gandallerItems
        {
            let item:MCreateItem = MCreateItem(gandaller:item)
            
            items.append(item)
        }
        
        items.sortInPlace
        { (itemA, itemB) -> Bool in
            
            let before:Bool = itemA.gandaller.fModel.created > itemB.gandaller.fModel.created
            
            return before
        }
        
        self.items = items
    }
}
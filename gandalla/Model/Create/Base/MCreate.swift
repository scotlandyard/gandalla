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
            
            let before:Bool
            let nameA:String = itemA.gandaller.fModel.name
            let nameB:String = itemB.gandaller.fModel.name
            let comparisonResult:NSComparisonResult = nameA.compare(
                nameB,
                options:NSStringCompareOptions.CaseInsensitiveSearch,
                range:nil,
                locale:nil)
                
            switch comparisonResult
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
        
        self.items = items
    }
}
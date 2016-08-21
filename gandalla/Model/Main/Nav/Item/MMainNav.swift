import Foundation

class MMainNav
{
    let items:[MMainNavItem]
    weak var current:MMainNavItem!
    
    init()
    {
        var items:[MMainNavItem] = []
        let itemNews:MMainNavItem = MMainNavItem.News(items.count)
        items.append(itemNews)
        let itemCreate:MMainNavItem = MMainNavItem.Create(items.count)
        items.append(itemCreate)
        self.items = items
        selectItem(itemNews)
    }
    
    //MARK: public
    
    func selectItem(selected:MMainNavItem)
    {
        current = selected
        
        for item:MMainNavItem in items
        {
            let state:MMainNavItemState
            
            if item === selected
            {
                state = MMainNavItemState.Active()
            }
            else
            {
                state = MMainNavItemState.None()
            }
            
            item.restate(state)
        }
    }
}
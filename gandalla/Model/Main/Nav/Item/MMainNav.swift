import Foundation

class MMainNav
{
    let items:[MMainNavItem]
    weak var current:MMainNavItem!
    
    init()
    {
        var items:[MMainNavItem] = []
        
        let itemLiked:MMainNavItemLiked = MMainNavItemLiked(index:items.count)
        items.append(itemLiked)
        
        let itemNews:MMainNavItemNews = MMainNavItemNews(index:items.count)
        items.append(itemNews)
        
        let itemGandallers:MMainNavItemGandallers = MMainNavItemGandallers(index:items.count)
        items.append(itemGandallers)

        let itemChampions:MMainNavItem = MMainNavItemChampions(index:items.count)
        items.append(itemChampions)
        
        #if DEBUG
            
            let itemCreate:MMainNavItemCreate = MMainNavItemCreate(index:items.count)
            items.append(itemCreate)
            
            let itemNotifications:MMainNavItemNotifications = MMainNavItemNotifications(index:items.count)
            items.append(itemNotifications)
            
        #endif
        
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
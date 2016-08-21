import UIKit

class MMainNavItemStateNone:MMainNavItemState
{
    private let kSelectable:Bool = true
    private let kHighlightable:Bool = true
    
    init()
    {
        let color:UIColor = UIColor(white:0, alpha:0.2)
        
        super.init(color:color, selectable:kSelectable, highlightable:kHighlightable)
    }
}
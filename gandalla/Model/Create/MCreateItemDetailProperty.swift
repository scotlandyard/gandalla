import UIKit

class MCreateItemDetailProperty
{
    let reusableIdentifier:String
    let cellHeight:CGFloat
    var items:[MCreateItemDetailPropertyItem]
    
    init(reusableIdentifier:String, cellHeight:CGFloat, items:[MCreateItemDetailPropertyItem])
    {
        self.reusableIdentifier = reusableIdentifier
        self.cellHeight = cellHeight
        self.items = items
    }
}
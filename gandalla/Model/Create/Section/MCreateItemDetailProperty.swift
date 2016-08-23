import UIKit

class MCreateItemDetailProperty
{
    let name:String
    let reusableIdentifier:String
    let cellHeight:CGFloat
    var items:[MCreateItemDetailPropertyItem]
    
    init(fModel:FDatabaseModelGandaller)
    {
        fatalError()
    }
    
    init(name:String, reusableIdentifier:String, cellHeight:CGFloat, items:[MCreateItemDetailPropertyItem])
    {
        self.name = name
        self.reusableIdentifier = reusableIdentifier
        self.cellHeight = cellHeight
        self.items = items
    }
}
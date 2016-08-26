import UIKit

class MCreateItemDetailProperty
{
    let name:String
    let reusableIdentifier:String
    let cellHeight:CGFloat
    let addAvailable:Bool
    var items:[MCreateItemDetailPropertyItem]
    
    init(gandallerId:String, fModel:FDatabaseModelGandaller)
    {
        fatalError()
    }
    
    init(name:String, reusableIdentifier:String, cellHeight:CGFloat, items:[MCreateItemDetailPropertyItem], addAvailable:Bool)
    {
        self.name = name
        self.reusableIdentifier = reusableIdentifier
        self.cellHeight = cellHeight
        self.items = items
        self.addAvailable = addAvailable
    }
    
    //MARK: public
    
    func add()
    {
    }
}
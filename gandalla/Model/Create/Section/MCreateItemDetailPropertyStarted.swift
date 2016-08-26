import UIKit

class MCreateItemDetailPropertyStarted:MCreateItemDetailProperty
{
    private let kCellHeight:CGFloat = 50
    private let kAddAvailable:Bool = false
    
    override init(gandallerId:String, fModel:FDatabaseModelGandaller)
    {
        let name:String = NSLocalizedString("MCreateItemDetailPropertyStarted_name", comment:"")
        let reusableIdentifier:String = VCreateDetailCellStarted.reusableIdentifier()
        let itemStarted:MCreateItemDetailPropertyItemStarted = MCreateItemDetailPropertyItemStarted(started:fModel.started)
        let items:[MCreateItemDetailPropertyItem] = [
            itemStarted
        ]
        
        super.init(name:name, reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight, items:items, addAvailable:kAddAvailable)
    }
}
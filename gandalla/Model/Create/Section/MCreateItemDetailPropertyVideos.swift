import UIKit

class MCreateItemDetailPropertyVideos:MCreateItemDetailProperty
{
    private let kCellHeight:CGFloat = 50
    private let kAddAvailable:Bool = true
    
    override init(gandallerId:String, fModel:FDatabaseModelGandaller)
    {
        let name:String = NSLocalizedString("MCreateItemDetailPropertyVideos_name", comment:"")
        let reusableIdentifier:String = VCreateDetailCellText.reusableIdentifier()
        var items:[MCreateItemDetailPropertyItem] = []
        
        for fPower:FDatabaseModelGandallerPower in fModel.powers
        {
            let itemPower:MCreateItemDetailPropertyItemPower = MCreateItemDetailPropertyItemPower(gandallerId:gandallerId, fPower:fPower)
            items.append(itemPower)
        }
        
        super.init(name:name, reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight, items:items, addAvailable:kAddAvailable)
    }
    
    override func add(controller:CCreateDetail)
    {
        controller.addPower()
    }
}
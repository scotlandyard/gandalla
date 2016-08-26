import UIKit

class MCreateItemDetailPropertyPowers:MCreateItemDetailProperty
{
    private let kCellHeight:CGFloat = 50
    private let kAddAvailable:Bool = true
    
    override init(gandallerId:String, fModel:FDatabaseModelGandaller)
    {
        let name:String = NSLocalizedString("MCreateItemDetailPropertyPowers_name", comment:"")
        let reusableIdentifier:String = VCreateDetailCellText.reusableIdentifier()
        var items:[MCreateItemDetailPropertyItem] = []
        
        for fPower:FDatabaseModelGandallerPower in fModel.powers
        {
            let powerName:String = fPower.name
            let itemPower:MCreateItemDetailPropertyItemPower = MCreateItemDetailPropertyItemPower(power:powerName)
            items.append(itemPower)
        }
        
        super.init(name:name, reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight, items:items, addAvailable:kAddAvailable)
    }
    
    override func add(controller:CCreateDetail)
    {
        controller.addPower()
    }
}
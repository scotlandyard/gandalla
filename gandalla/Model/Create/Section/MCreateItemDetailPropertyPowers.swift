import UIKit

class MCreateItemDetailPropertyPowers:MCreateItemDetailProperty
{
    private let kCellHeight:CGFloat = 55
    private let kAddAvailable:Bool = true
    
    override init(gandallerId:String, fModel:FDatabaseModelGandaller)
    {
        let name:String = NSLocalizedString("MCreateItemDetailPropertyPowers_name", comment:"")
        let reusableIdentifier:String = VCreateDetailCellText.reusableIdentifier()
        var items:[MCreateItemDetailPropertyItemTextPower] = []
        
        for fPower:FDatabaseModelGandallerPower in fModel.powers
        {
            let itemPower:MCreateItemDetailPropertyItemTextPower = MCreateItemDetailPropertyItemTextPower(fPower:fPower, gandallerId:gandallerId)
            items.append(itemPower)
        }
        
        items.sortInPlace()
        { (itemA, itemB) -> Bool in
            
            let before:Bool
            let notificationA:String? = itemA.fPower.powerNotification
            
            if notificationA == nil
            {
                before = false
            }
            else
            {
                before = true
            }
            
            return before
        }
        
        super.init(name:name, reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight, items:items, addAvailable:kAddAvailable)
    }
    
    override func add(controller:CCreateDetail)
    {
        controller.addPower()
    }
}
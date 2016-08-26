import UIKit

class MCreateItemDetailPropertySocial:MCreateItemDetailProperty
{
    private let kCellHeight:CGFloat = 50
    private let kAddAvailable:Bool = false
    
    override init(gandallerId:String, fModel:FDatabaseModelGandaller)
    {
        let name:String = NSLocalizedString("MCreateItemDetailPropertySocial_name", comment:"")
        let reusableIdentifier:String = VCreateDetailCellText.reusableIdentifier()
        let itemFacebook:mcreateitemdetai
        let items:[MCreateItemDetailPropertyItem] = [
        ]
        
        for fPower:FDatabaseModelGandallerPower in fModel.powers
        {
            let itemPower:MCreateItemDetailPropertyItemPower = MCreateItemDetailPropertyItemPower(gandallerId:gandallerId, fPower:fPower)
            items.append(itemPower)
        }
        
        super.init(name:name, reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight, items:items, addAvailable:kAddAvailable)
    }
}
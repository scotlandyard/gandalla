import UIKit

class MCreateItemDetailPropertyImages:MCreateItemDetailProperty
{
    private let kCellHeight:CGFloat = 100
    
    override init(gandallerId:String, fModel:FDatabaseModelGandaller)
    {
        let name:String = NSLocalizedString("MCreateItemDetailPropertyImages_name", comment:"")
        let reusableIdentifier:String = VCreateDetailCellImage.reusableIdentifier()
        var items:[MCreateItemDetailPropertyItem] = []
        
        if fModel.images.isEmpty
        {
            let itemImage:MCreateItemDetailPropertyItemImage = MCreateItemDetailPropertyItemImage(gandallerId:gandallerId, fImage:nil)
            items.append(itemImage)
        }
        else
        {
            for fImage:FDatabaseModelGandallerImage in fModel.images
            {
                let itemImage:MCreateItemDetailPropertyItemImage = MCreateItemDetailPropertyItemImage(gandallerId:gandallerId, fImage:fImage)
                items.append(itemImage)
            }
        }
        
        super.init(name:name, reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight, items:items)
    }
}
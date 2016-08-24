import UIKit

class MCreateItemDetailPropertyImages:MCreateItemDetailProperty
{
    private let kCellHeight:CGFloat = 150
    
    override init(fModel:FDatabaseModelGandaller)
    {
        let name:String = NSLocalizedString("MCreateItemDetailPropertyImages_name", comment:"")
        let reusableIdentifier:String = VCreateDetailCellImage.reusableIdentifier()
        var items:[MCreateItemDetailPropertyItem] = []
        
        for fImage:FDatabaseModelGandallerImage in fModel.images
        {
            let itemImage:MCreateItemDetailPropertyItemImage = MCreateItemDetailPropertyItemImage(image:nil)
            items.append(itemImage)
        }
        
        super.init(name:name, reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight, items:items)
    }
}
import UIKit

class MCreateItemDetailPropertyImages:MCreateItemDetailProperty
{
    private let kCellHeight:CGFloat = 90
    
    override init(fModel:FDatabaseModelGandaller)
    {
        let name:String = NSLocalizedString("MCreateItemDetailPropertyImages_name", comment:"")
        let reusableIdentifier:String = VCreateDetailCellImage.reusableIdentifier()
        let itemStarted:MCreateItemDetailPropertyItemStarted = MCreateItemDetailPropertyItemStarted(started:fModel.started)
        let items:[MCreateItemDetailPropertyItem] = [
            itemStarted
        ]
        
        super.init(name:name, reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight, items:items)
    }
}
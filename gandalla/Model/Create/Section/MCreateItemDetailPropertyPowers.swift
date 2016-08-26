import UIKit

class MCreateItemDetailPropertyPowers:MCreateItemDetailProperty
{
    private let kCellHeight:CGFloat = 50
    private let kAddAvailable:Bool = true
    
    override init(gandallerId:String, fModel:FDatabaseModelGandaller)
    {
        let name:String = NSLocalizedString("MCreateItemDetailPropertyPowers_name", comment:"")
        let reusableIdentifier:String = VCreateDetailCellText.reusableIdentifier()
        let profileImageId:String? = fModel.profileImage
        var items:[MCreateItemDetailPropertyItem] = []
        
        for fImage:FDatabaseModelGandallerImage in fModel.images
        {
            var profileImage:Bool = false
            
            if profileImageId != nil
            {
                if fImage.imageId == profileImageId
                {
                    profileImage = true
                }
            }
            
            let itemImage:MCreateItemDetailPropertyItemImage = MCreateItemDetailPropertyItemImage(gandallerId:gandallerId, fImage:fImage, profileImage:profileImage)
            items.append(itemImage)
        }
        
        super.init(name:name, reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight, items:items, addAvailable:kAddAvailable)
    }
    
    override func add(controller:CCreateDetail)
    {
    }
}
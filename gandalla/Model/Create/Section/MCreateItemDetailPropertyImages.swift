import UIKit

class MCreateItemDetailPropertyImages:MCreateItemDetailProperty
{
    private let kCellHeight:CGFloat = 100
    private let kAddAvailable:Bool = true
    
    override init(gandallerId:String, fModel:FDatabaseModelGandaller)
    {
        let name:String = NSLocalizedString("MCreateItemDetailPropertyImages_name", comment:"")
        let reusableIdentifier:String = VCreateDetailCellImage.reusableIdentifier()
        let profileImageId:String? = fModel.profileImage
        var items:[MCreateItemDetailPropertyItemImage] = []
        
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
        
        items.sortInPlace()
        { (itemA, itemB) -> Bool in
            
            let before:Bool
            let profileA:Bool = itemA.profileImage
            let profileB:Bool = itemB.profileImage
            let notificationA:String? = itemA.fImage.imageNotification
            
            if profileA
            {
                before = true
            }
            else if profileB
            {
                before = false
            }
            else
            {
                if notificationA == nil
                {
                    before = false
                }
                else
                {
                    before = true
                }
            }
            
            return before
        }
        
        super.init(name:name, reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight, items:items, addAvailable:kAddAvailable)
    }
    
    override func add(controller:CCreateDetail)
    {
        controller.addImage()
    }
}
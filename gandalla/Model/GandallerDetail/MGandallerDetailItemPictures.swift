import UIKit

class MGandallerDetailItemPictures:MGandallerDetailItem
{
    let cellSize:CGFloat
    let items:[MGandallerDetailItemPicturesItem]
    private let kSelectable:Bool = false
    
    init(modelGandaller:MGandallerItem)
    {
        let reusableIdentifier:String = VGandallerDetailCellPictures.reusableIdentifier()
        let screenSize:CGSize = UIScreen.mainScreen().bounds.size
        let screenWidth:CGFloat = screenSize.width
        let screenHeight:CGFloat = screenSize.height
        
        if screenWidth < screenHeight
        {
            cellSize = screenWidth
        }
        else
        {
            cellSize = screenHeight
        }
        
        let gandallerId:String = modelGandaller.gandallerId
        let profileImageId:String? = modelGandaller.fModel.profileImage
        var items:[MGandallerDetailItemPicturesItem] = []
        
        for fImage:FDatabaseModelGandallerImage in modelGandaller.fModel.images
        {
            let imageStatus:FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus = fImage.status
            
            if imageStatus == FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus.Ready
            {
                let profileImage:Bool
                let imageId:String = fImage.imageId
                
                if profileImageId == imageId
                {
                    profileImage = true
                }
                else
                {
                    profileImage = false
                }
                
                let imageItem:MGandallerDetailItemPicturesItem = MGandallerDetailItemPicturesItem(gandallerId:gandallerId, imageId:imageId, profileImage:profileImage)
                items.append(imageItem)
            }
        }
        
        items.sortInPlace()
        { (itemA, itemB) -> Bool in
            
            let before:Bool
            
            if itemA.profileImage
            {
                before = true
            }
            else
            {
                before = false
            }
            
            return before
        }
        
        self.items = items
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:cellSize, selectable:kSelectable)
    }
}
import Foundation

class MGandallerItem
{
    let gandallerId:String
    private(set) var fModel:FDatabaseModelGandaller
    let image:MGandallerItemImage
    
    init(gandallerId:String, fModel:FDatabaseModelGandaller)
    {
        self.gandallerId = gandallerId
        self.fModel = fModel
        image = MGandallerItemImage(gandallerId:gandallerId)
        
        profileImage()
    }
    
    //MARK: private
    
    private func profileImage()
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            let profileImageId:String? = self?.fModel.profileImage
            
            if profileImageId != nil
            {
                if self?.image.imageId != profileImageId
                {
                    self?.image.getImage(profileImageId!)
                }
            }
        }
    }
    
    //MARK: public
    
    func copy() -> MGandallerItem
    {
        let duplicated:MGandallerItem = MGandallerItem(gandallerId:gandallerId, fModel:fModel)
        
        return duplicated
    }
    
    func update(fModel:FDatabaseModelGandaller)
    {
        self.fModel = fModel
        profileImage()
    }
}
import UIKit

class MGandallerDetailItemPicturesItem
{
    let imageId:String
    let gandallerId:String
    var imageBinary:UIImage?
    
    init(gandallerId:String, imageId:String)
    {
        self.gandallerId = gandallerId
        self.imageId = imageId
        
        getImage()
    }
    
    //MARK: private
    
    private func imageReceived(data:NSData?)
    {
        if data != nil
        {
            imageBinary = UIImage(data:data!)
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
            { [weak self] in
                
                self?.updateListeners()
            }
        }
    }
    
    //MARK: public
    
    func getImage()
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            if self != nil
            {
                let reference:FStorage.FStorageReference = FStorage.FStorageReference.Gandaller
                
                FMain.sharedInstance.storage.loadData(
                    reference,
                    parentId:self!.gandallerId,
                    childId:self!.imageId)
                { [weak self] (data) in
                    
                    self?.imageReceived(data)
                }
            }
        }
    }
    
    func updateListeners()
    {
        let imageKey:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.Images.rawValue
        let userInfo:[String:AnyObject] = [imageKey:imageId]
        
        NSNotificationCenter.defaultCenter().postNotificationName(
            NSNotification.NSNotificationName.ImageLoaded.rawValue,
            object:nil,
            userInfo:userInfo)
    }
}
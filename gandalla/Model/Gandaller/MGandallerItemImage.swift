import UIKit

class MGandallerItemImage
{
    let gandallerId:String
    var imageId:String?
    var imageBinary:UIImage?
    
    init(gandallerId:String)
    {
        self.gandallerId = gandallerId
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
    
    func getImage(imageId:String)
    {
        let reference:FStorage.FStorageReference = FStorage.FStorageReference.Gandaller
        self.imageId = imageId
        
        FMain.sharedInstance.storage.loadData(
            reference,
            parentId:gandallerId,
            childId:imageId)
        { [weak self] (data) in
            
            self?.imageReceived(data)
        }
    }
    
    func updateListeners()
    {
        let gandallerKey:String = FDatabase.FDatabaseReference.Gandaller.rawValue
        let userInfo:[String:AnyObject] = [gandallerKey:gandallerId]
        
        NSNotificationCenter.defaultCenter().postNotificationName(
            NSNotification.NSNotificationName.GandallerImage.rawValue,
            object:nil,
            userInfo:userInfo)
    }
}
import Foundation
import Firebase

class FStorage
{
    private let storage:FIRStorage
    private let storageReference:FIRStorageReference
    
    init()
    {
        storage = FIRStorage.storage()
        storageReference = storage.reference()
    }
    
    //MARK: public
    
    func savePoem(poemId:String, poem:NSData, completionHandler:((error:String?) -> ())?)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        {   
            let fPoem:FStoragePoem = FStoragePoem()
            fPoem.save(poemId, poem:poem, storage:self.storageReference, completionHandler:completionHandler)
        }
    }
    
    func deletePoem(poemId:String, completionHandler:((error:String?) -> ())?)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        {
            let fPoem:FStoragePoem = FStoragePoem()
            fPoem.delete(poemId, storage:self.storageReference, completionHandler:completionHandler)
        }
    }
    
    func loadPoem(poemId:String, completionHandler:((poem:String?, error:String?) -> ())?)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        {
            let fPoem:FStoragePoem = FStoragePoem()
            fPoem.load(poemId, storage: self.storageReference, completionHandler:completionHandler)
        }
    }
}
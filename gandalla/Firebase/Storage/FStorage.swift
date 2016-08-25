import Foundation
import Firebase

class FStorage
{
    enum FStorageReference:String
    {
        case Gandaller = "gandaller"
    }
    
    private let storage:FIRStorage
    private let storageReference:FIRStorageReference
    private let kTenMegaBytes:Int64 = 10485760
    
    init()
    {
        storage = FIRStorage.storage()
        storageReference = storage.reference()
    }
    
    //MARK: private
    
    private func asyncSaveData(reference:FStorageReference, parentId:String, childId:String, data:NSData, completionHandler:((error:String?) -> ()))
    {
        let parentReference:FIRStorageReference = storageReference.child(reference.rawValue).child(parentId)
        let childReference:FIRStorageReference = parentReference.child(childId)
        childReference.putData(data, metadata:nil)
        { (metadata, error) in
            
            let errorString:String? = error?.localizedDescription
            completionHandler(error:errorString)
        }
    }
    
    private func asyncDeleteData(reference:FStorageReference, parentId:String, childId:String, completionHandler:((error:String?) -> ())?)
    {
        let parentReference:FIRStorageReference = storageReference.child(reference.rawValue).child(parentId)
        let childReference:FIRStorageReference = parentReference.child(childId)
        childReference.deleteWithCompletion
        { (error) in
            
            let errorString:String? = error?.localizedDescription
            completionHandler?(error:errorString)
        }
    }
    
    private func asyncLoadData(reference:FStorageReference, parentId:String, childId:String, completionHandler:((data:NSData?) -> ()))
    {
        let parentReference:FIRStorageReference = storageReference.child(reference.rawValue).child(parentId)
        let childReference:FIRStorageReference = parentReference.child(childId)
        childReference.dataWithMaxSize(kTenMegaBytes)
        { (data, error) in
            
            let sendData:NSData?
            
            if error != nil
            {
                sendData = nil
            }
            else
            {
                sendData = data
            }
            
            completionHandler(data:sendData)
        }
    }
    
    //MARK: public
    
    func saveData(reference:FStorageReference, parentId:String, childId:String, data:NSData, completionHandler:((error:String?) -> ()))
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        {
            self.asyncSaveData(reference, parentId:parentId, childId:childId, data:data, completionHandler:completionHandler)
        }
    }
    
    func deleteData(reference:FStorageReference, parentId:String, childId:String, completionHandler:((error:String?) -> ())?)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        {
            self.asyncDeleteData(reference, parentId:parentId, childId:childId, completionHandler:completionHandler)
        }
    }
    
    func loadData(reference:FStorageReference, parentId:String, childId:String, completionHandler:((data:NSData?) -> ()))
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        {
            self.asyncLoadData(reference, parentId:parentId, childId:childId, completionHandler:completionHandler)
        }
    }
}
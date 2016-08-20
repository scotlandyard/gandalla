import Foundation
import Firebase

class FStoragePoem
{
    private let kReferenceRoot:String = "poems"
    private let kFiveMegaBytes:Int64 = 5242880
    
    init()
    {
    }
    
    //MARK: public
    
    func save(poemId:String, poem:NSData, storage:FIRStorageReference, completionHandler:((error:String?) -> ())?)
    {
        let rootReference:FIRStorageReference = storage.child(kReferenceRoot)
        let poemReference:FIRStorageReference = rootReference.child(poemId)
        poemReference.putData(poem, metadata:nil)
        { (metadata, error) in
            
            let errorString:String?
            
            if error == nil
            {
                errorString = nil
            }
            else
            {
                print(error!)
                
                errorString = NSLocalizedString("FStoragePoem_errorSaving", comment:"")
            }
            
            completionHandler?(error:errorString)
        }
    }
    
    func delete(poemId:String, storage:FIRStorageReference, completionHandler:((error:String?) -> ())?)
    {
        let rootReference:FIRStorageReference = storage.child(kReferenceRoot)
        let poemReference:FIRStorageReference = rootReference.child(poemId)
        poemReference.deleteWithCompletion
        { (error) in
            
            let errorString:String? = error?.localizedDescription
            completionHandler?(error:errorString)
        }
    }
    
    func load(poemId:String, storage:FIRStorageReference, completionHandler:((poem:String?, error:String?) -> ())?)
    {
        let rootReference:FIRStorageReference = storage.child(kReferenceRoot)
        let poemReference:FIRStorageReference = rootReference.child(poemId)
        
        poemReference.dataWithMaxSize(kFiveMegaBytes)
        { (data, error) in
            
            let poem:String?
            let errorString:String?
            
            if error == nil && data != nil
            {
                poem = String(data:data!, encoding:NSUTF8StringEncoding)
                
                if poem == nil
                {
                    errorString = NSLocalizedString("general_errorDownload", comment:"")
                }
                else
                {
                    errorString = nil
                }
            }
            else
            {
                poem = nil
                let errorDescription:String? = error!.localizedDescription
                
                if errorDescription == nil
                {
                    errorString = NSLocalizedString("general_errorDownload", comment:"")
                }
                else
                {
                    errorString = errorDescription
                }
            }
            
            completionHandler?(poem:poem, error:errorString)
        }
    }
}
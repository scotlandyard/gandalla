import Foundation
import FirebaseDatabase

class FDatabase
{
    private let reference:FIRDatabaseReference
    private let kReferenceUser:String = "user"
    private let kReferenceGandaller:String = "gandaller"
    
    init()
    {
        reference = FIRDatabase.database().reference()
    }
    
    //MARK: public -
    //MARK: user
    
    func createUser() -> String
    {
        let fUser:FDatabaseModelUser = FDatabaseModelUser()
        let fUserJson:[String:AnyObject] = fUser.modelJson()
        let newUser:FIRDatabaseReference = reference.child(kReferenceUser).childByAutoId()
        let newUserId:String = newUser.key
        newUser.setValue(fUserJson)
        
        return newUserId
    }
    
    //MARK: gandallers
    
    func createGandaller()
    {
        let fGandaller:FDatabaseModelGandaller = FDatabaseModelGandallerPaused()
        let fGandallerJson:[String:AnyObject] = fGandaller.modelJson()
        let newGandaller:FIRDatabaseReference = reference.child(kReferenceGandaller).childByAutoId()
        newGandaller.setValue(fGandallerJson)
    }
    
    func listenGandaller(snapBlock:((FIRDataSnapshot) -> Void)) -> UInt
    {
        let gandallerReference:FIRDatabaseReference = reference.child(kReferenceGandaller)
        let handler:UInt = gandallerReference.observeEventType(FIRDataEventType.Value, withBlock:snapBlock)
        
        return handler
    }
    
    func stopListeningGandaller(handler:UInt)
    {
        let gandallerReference:FIRDatabaseReference = reference.child(kReferenceGandaller)
        gandallerReference.removeObserverWithHandle(handler)
    }
}
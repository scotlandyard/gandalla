import Foundation
import FirebaseDatabase

class FDatabase
{
    private let reference:FIRDatabaseReference
    private let kReferenceUser:String = "user"
    private let kReferencePoem:String = "poem"
    
    init()
    {
        reference = FIRDatabase.database().reference()
    }
    
    //MARK: public
    //MARK: user
    
    func newUser(fUser:FDatabaseModel) -> String
    {
        let userJson:[String:AnyObject] = fUser.modelJson()
        let newUser:FIRDatabaseReference = reference.child(kReferenceUser).childByAutoId()
        let newUserId:String = newUser.key
        newUser.setValue(userJson)
        
        return newUserId
    }
    
    func updateUser(userId:String, property:[String:AnyObject])
    {
        let userReference = reference.child(kReferenceUser).child(userId)
        userReference.updateChildValues(property)
    }
    
    func listenUser(userId:String, snapBlock:((FIRDataSnapshot) -> Void)) -> UInt
    {
        let userReference:FIRDatabaseReference = reference.child(kReferenceUser).child(userId)
        let handler:UInt = userReference.observeEventType(FIRDataEventType.Value, withBlock:snapBlock)
        
        return handler
    }
    
    func listenUser(userId:String, property:String, snapBlock:((FIRDataSnapshot) -> Void))
    {
        let userReference:FIRDatabaseReference = reference.child(kReferenceUser).child(userId)
        let propertyReference:FIRDatabaseReference = userReference.child(property)
        propertyReference.observeSingleEventOfType(FIRDataEventType.Value, withBlock:snapBlock)
    }
    
    func stopListener(userId:String, handler:UInt)
    {
        let userReference:FIRDatabaseReference = reference.child(kReferenceUser).child(userId)
        userReference.removeObserverWithHandle(handler)
    }
    
    //MARK: poem
    
    func newPoem(fPoem:FDatabaseModel) -> String
    {
        let userJson:[String:AnyObject] = fPoem.modelJson()
        let newPoem:FIRDatabaseReference = reference.child(kReferencePoem).childByAutoId()
        let newPoemId:String = newPoem.key
        newPoem.setValue(userJson)
        
        return newPoemId
    }
    
    func updatePoem(poemId:String, property:[String:AnyObject])
    {
        let poemReference = reference.child(kReferencePoem).child(poemId)
        poemReference.updateChildValues(property)
    }
    
    func listenPoems(snapBlock:((FIRDataSnapshot) -> Void))
    {
        let poemsReference:FIRDatabaseReference = reference.child(kReferencePoem)
        poemsReference.observeSingleEventOfType(FIRDataEventType.Value, withBlock:snapBlock)
    }
    
    func deletePoem(poemId:String)
    {
        let poemReference = reference.child(kReferencePoem).child(poemId)
        poemReference.removeValue()
    }
}
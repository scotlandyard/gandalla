import Foundation
import FirebaseDatabase

class FDatabase
{
    private let reference:FIRDatabaseReference
    
    enum FDatabaseReference:String
    {
        case User = "user"
        case Gandaller = "gandaller"
        case News = "news"
    }
    
    init()
    {
        reference = FIRDatabase.database().reference()
    }
    
    //MARK: public
    
    func listenParent(parent:FDatabaseReference, snapBlock:((FIRDataSnapshot) -> Void)) -> UInt
    {
        let parentName:String = parent.rawValue
        let parentReference:FIRDatabaseReference = reference.child(parentName)
        let handler:UInt = parentReference.observeEventType(FIRDataEventType.Value, withBlock:snapBlock)
        
        return handler
    }
    
    func stopListeningParent(parent:FDatabaseReference, handler:UInt)
    {
        let parentName:String = parent.rawValue
        let parentReference:FIRDatabaseReference = reference.child(parentName)
        parentReference.removeObserverWithHandle(handler)
    }
    
    func createChild(parent:FDatabaseReference, json:[String:AnyObject]) -> String
    {
        let parentName:String = parent.rawValue
        let childReference:FIRDatabaseReference = reference.child(parentName).childByAutoId()
        let childId:String = childReference.key
        childReference.setValue(json)
        
        return childId
    }
    
    func updateProperty(parent:FDatabaseReference, childId:String, property:String, value:AnyObject)
    {
        let parentName:String = parent.rawValue
        let propertyReference:FIRDatabaseReference = reference.child(parentName).child(childId).child(property)
        propertyReference.setValue(value)
    }
}
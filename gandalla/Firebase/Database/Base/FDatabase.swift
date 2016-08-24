import Foundation
import FirebaseDatabase

class FDatabase
{
    enum FDatabaseReference:String
    {
        case User = "user"
        case Gandaller = "gandaller"
        case News = "news"
    }
    
    private let reference:FIRDatabaseReference
    
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
    
    func createSubChild(parent:FDatabaseReference, childId:String, property:String, json:[String:AnyObject]) -> String
    {
        let parentName:String = parent.rawValue
        let propertyReference:FIRDatabaseReference = reference.child(parentName).child(childId).child(property)
        let subChild:FIRDatabaseReference = propertyReference.childByAutoId()
        let subChildId:String = subChild.key
        subChild.setValue(json)
        
        return subChildId
    }
    
    func updateProperty(parent:FDatabaseReference, childId:String, property:String, value:AnyObject)
    {
        let parentName:String = parent.rawValue
        let propertyReference:FIRDatabaseReference = reference.child(parentName).child(childId).child(property)
        propertyReference.setValue(value)
    }
    
    func updateSubProperty(parent:FDatabaseReference, childId:String, property:String, subChildId:String, subPropertyId:String, value:AnyObject)
    {
        let parentName:String = parent.rawValue
        let propertyReference:FIRDatabaseReference = reference.child(parentName).child(childId).child(property)
        let subPropertyReference:FIRDatabaseReference = propertyReference.child(subChildId).child(subPropertyId)
        subPropertyReference.setValue(value)
    }
    
    func deleteSubProperty(parent:FDatabaseReference, childId:String, property:String, subChildId:String, subPropertyId:String)
    {
        let parentName:String = parent.rawValue
        let propertyReference:FIRDatabaseReference = reference.child(parentName).child(childId).child(property)
        let subPropertyReference:FIRDatabaseReference = propertyReference.child(subChildId).child(subPropertyId)
        subPropertyReference.removeValue()
    }
}
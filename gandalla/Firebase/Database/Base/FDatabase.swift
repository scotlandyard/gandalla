import Foundation
import FirebaseDatabase

class FDatabase
{
    private let reference:FIRDatabaseReference
    private let kReferenceUser:String = "user"
    
    init()
    {
        reference = FIRDatabase.database().reference()
        
        let userReference:FIRDatabaseReference = reference.child("pedro")
        userReference.observeSingleEventOfType(FIRDataEventType.Value, withBlock:
        { (snap) in
            
            print("value:::: \(snap.value)")
        })
    }
    
    //MARK: public -
    //MARK: user
    
    func createUser() -> String
    {
        let newUser:FIRDatabaseReference = reference.child("pedro").childByAutoId()
        let newUserId:String = newUser.key
        
        return newUserId
    }
}
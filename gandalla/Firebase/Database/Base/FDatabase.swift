import Foundation
import FirebaseDatabase

class FDatabase
{
    private let reference:FIRDatabaseReference
    private let kReferenceUser:String = "user"
    private let kReferencePoem:String = "gandaller"
    
    init()
    {
        reference = FIRDatabase.database().reference()
    }
    
    //MARK: public -
    //MARK: user
    
    func createUser() -> String
    {
        let newUser:FIRDatabaseReference = reference.child(kReferenceUser).childByAutoId()
        let newUserId:String = newUser.key
        
        return newUserId
    }
}
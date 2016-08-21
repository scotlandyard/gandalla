import Foundation
import FirebaseDatabase

class FDatabase
{
    private let reference:FIRDatabaseReference
    private let kReferenceUser:String = "user"
    
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
}
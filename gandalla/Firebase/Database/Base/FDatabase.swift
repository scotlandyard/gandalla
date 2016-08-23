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
    
    //MARK: public -
    //MARK: user
    
    func createUser() -> String
    {
        let fUser:FDatabaseModelUser = FDatabaseModelUser()
        let fUserJson:[String:AnyObject] = fUser.modelJson()
        let parentName:String = FDatabaseReference.User.rawValue
        let newUser:FIRDatabaseReference = reference.child(parentName).childByAutoId()
        let newUserId:String = newUser.key
        newUser.setValue(fUserJson)
        
        return newUserId
    }
    
    //MARK: gandallers
    
    func createGandaller()
    {
        let fGandaller:FDatabaseModelGandaller = FDatabaseModelGandallerPaused()
        let fGandallerJson:[String:AnyObject] = fGandaller.modelJson()
        let parentName:String = FDatabaseReference.Gandaller.rawValue
        let newGandaller:FIRDatabaseReference = reference.child(parentName).childByAutoId()
        newGandaller.setValue(fGandallerJson)
    }
    
    func listenGandaller(snapBlock:((FIRDataSnapshot) -> Void)) -> UInt
    {
        let parentName:String = FDatabaseReference.Gandaller.rawValue
        let gandallerReference:FIRDatabaseReference = reference.child(parentName)
        let handler:UInt = gandallerReference.observeEventType(FIRDataEventType.Value, withBlock:snapBlock)
        
        return handler
    }
    
    func stopListeningGandaller(handler:UInt)
    {
        let parentName:String = FDatabaseReference.Gandaller.rawValue
        let gandallerReference:FIRDatabaseReference = reference.child(parentName)
        gandallerReference.removeObserverWithHandle(handler)
    }
    
    func updateGandaller(gandallerId:String, property:String, value:AnyObject)
    {
        let parentName:String = FDatabaseReference.Gandaller.rawValue
        let propertyReference:FIRDatabaseReference = reference.child(parentName).child(gandallerId).child(property)
        propertyReference.setValue(value)
    }
    
    //MARK: news
    
    func createNews(fNews:FDatabaseModelNews)
    {
        let fNewsJson:[String:AnyObject] = fNews.modelJson()
        let parentName:String = FDatabaseReference.News.rawValue
        let newNews:FIRDatabaseReference = reference.child(parentName).childByAutoId()
        newNews.setValue(fNewsJson)
    }
}
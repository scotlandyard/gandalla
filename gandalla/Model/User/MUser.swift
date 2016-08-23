import Foundation

class MUser
{
    static let sharedInstance = MUser()
    var dbUser:DGandallaUser!
    
    private init()
    {
    }
    
    //MARK: private
    
    private func createUser()
    {
        DManager.sharedInstance.managerGandalla.createManagedObject(
            DGandallaUser.self)
        { (object) in
            
            self.dbUser = object
            self.linkUserFirebase()
        }
    }
    
    private func linkUserFirebase()
    {
        let fUser:FDatabaseModelUser = FDatabaseModelUser()
        let json:[String:AnyObject] = fUser.modelJson()
        let userId:String = FMain.sharedInstance.database.createChild(FDatabase.FDatabaseReference.User, json:json)
        dbUser?.userId = userId
        DManager.sharedInstance.managerGandalla.saver.save(false)
    }
    
    //MARK: public
    
    func load()
    {
        DManager.sharedInstance.managerGandalla.fetchManagedObjects(
            DGandallaUser.self,
            limit:1)
        { (objects) in
            
            if objects.isEmpty
            {
                self.createUser()
            }
            else
            {
                self.dbUser = objects.first
            }
        }
    }
}
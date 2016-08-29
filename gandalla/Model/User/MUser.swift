import UIKit

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
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_SEC)), dispatch_get_main_queue())
        { [weak self] in
            
            self?.askNotifications()
        }
    }
    
    private func askNotifications()
    {
        let settings:UIUserNotificationSettings = UIUserNotificationSettings(forTypes:[.Alert,.Badge,.Sound], categories:nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        UIApplication.sharedApplication().registerForRemoteNotifications()
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
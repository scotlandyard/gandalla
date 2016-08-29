import Foundation
import Firebase

class FMain
{
    static let sharedInstance = FMain()
    let storage:FStorage
    let analytics:FAnalytics
    let database:FDatabase
    
    private init()
    {
        FIRApp.configure()
        FIRConfiguration.sharedInstance().logLevel = FIRLogLevel.Error
        storage = FStorage()
        analytics = FAnalytics()
        database = FDatabase()
    }
    
    //MARK: public
    
    func load()
    {
    }
}
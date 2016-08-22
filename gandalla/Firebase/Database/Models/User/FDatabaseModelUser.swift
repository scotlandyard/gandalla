import Foundation

class FDatabaseModelUser:FDatabaseModel
{
    let created:NSTimeInterval
    
    enum FDatabaseModelUserKey:String
    {
        case Created = "created"
    }
    
    init()
    {
        created = NSDate().timeIntervalSince1970
    }
    
    //MARK: public
    
    func modelJson() -> [String:AnyObject]
    {
        let dict:[String:AnyObject] = [
            FDatabaseModelUserKey.Created.rawValue:created
        ]
        
        return dict
    }
}
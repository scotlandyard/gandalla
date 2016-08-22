import Foundation

class FDatabaseModelUser:FDatabaseModel
{
    let created:NSTimeInterval
    let kKeyCreated:String = "created"
    
    init()
    {
        created = NSDate().timeIntervalSince1970
    }
    
    //MARK: public
    
    func modelJson() -> [String:AnyObject]
    {
        let dict:[String:AnyObject] = [
            kKeyCreated:created
        ]
        
        return dict
    }
}
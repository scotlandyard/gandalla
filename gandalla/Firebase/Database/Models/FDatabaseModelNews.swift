import Foundation

class FDatabaseModelNews:FDatabaseModel
{
    @objc enum FDatabaseModelNewsType:Int
    {
        case Joined
        case NewPicture
        case NewSuperPower
        case NewVideo
        case UpdatedSocial
    }
    
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
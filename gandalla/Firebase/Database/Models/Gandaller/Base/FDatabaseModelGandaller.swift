import Foundation

class FDatabaseModelGandaller:FDatabaseModel
{
    enum FDatabaseModelGandallerStatus:Int
    {
        case Paused
        case Active
    }
    
    enum FDatabaseModelGandallerKey:String
    {
        case Status = "status"
        case Created = "created"
        case Name = "name"
        case Images = "images"
        case Powers = "powers"
        case Videos = "videos"
        case Social = "social"
    }
    
    let status:FDatabaseModelGandallerStatus
    let created:NSTimeInterval
    var name:String
    let social:FDatabaseModelGandallerSocial
    var images:[FDatabaseModelGandallerImage]
    var powers:[FDatabaseModelGandallerPower]
    var videos:[FDatabaseModelGandallerVideo]
    
    init(status:FDatabaseModelGandallerStatus)
    {
        self.status = status
        created = NSDate().timeIntervalSince1970
        name = ""
        social = FDatabaseModelGandallerSocial()
        images = []
        powers = []
        videos = []
    }
    
    //MARK: public
    
    func modelJson() -> [String:AnyObject]
    {
        let arraySocial:
        
        var dict:[String:AnyObject] = [
            FDatabaseModelGandallerKey.Name.rawValue:name,
            FDatabaseModelGandallerKey.Created.rawValue:created,
            FDatabaseModelGandallerKey.Social.rawValue
        ]
        
        social.modelJson(&dict)
        
        return dict
    }
}
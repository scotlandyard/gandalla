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
    
    init(json:[String:AnyObject])
    {
        let rawStatus:Int = json[FDatabaseModelGandallerKey.Status.rawValue] as! Int
        let rawCreated:NSTimeInterval = json[FDatabaseModelGandallerKey.Created.rawValue] as! NSTimeInterval
        let rawName:String = json[FDatabaseModelGandallerKey.Name.rawValue] as! String
        
        status = FDatabaseModelGandallerStatus(rawValue:rawStatus)!
        created = rawCreated
        name = rawName
    }
    
    //MARK: public
    
    func modelJson() -> [String:AnyObject]
    {
        let jsonSocial:[String:AnyObject] = social.modelJson()
        var jsonImages:[String] = []
        var jsonPowers:[String] = []
        var jsonVideos:[String] = []
        
        for image:FDatabaseModelGandallerImage in images
        {
            let imageId:String = image.imageid
            jsonImages.append(imageId)
        }
        
        for power:FDatabaseModelGandallerPower in powers
        {
            let name:String = power.name
            jsonPowers.append(name)
        }
        
        for video:FDatabaseModelGandallerVideo in videos
        {
            let url:String = video.url
            jsonVideos.append(url)
        }
        
        let json:[String:AnyObject] = [
            FDatabaseModelGandallerKey.Status.rawValue:status.rawValue,
            FDatabaseModelGandallerKey.Name.rawValue:name,
            FDatabaseModelGandallerKey.Created.rawValue:created,
            FDatabaseModelGandallerKey.Social.rawValue:jsonSocial,
            FDatabaseModelGandallerKey.Images.rawValue:jsonImages,
            FDatabaseModelGandallerKey.Powers.rawValue:jsonPowers,
            FDatabaseModelGandallerKey.Videos.rawValue:jsonVideos
        ]
        
        return json
    }
}
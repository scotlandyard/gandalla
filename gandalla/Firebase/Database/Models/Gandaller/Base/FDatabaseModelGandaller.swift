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
        let rawSocial:[String:AnyObject] = json[FDatabaseModelGandallerKey.Social.rawValue] as! [String:AnyObject]
        let rawImages:[String] = json[FDatabaseModelGandallerKey.Images.rawValue] as! [String]
        let rawPowers:[String] = json[FDatabaseModelGandallerKey.Powers.rawValue] as! [String]
        let rawVideos:[String] = json[FDatabaseModelGandallerKey.Videos.rawValue] as! [String]
        
        status = FDatabaseModelGandallerStatus(rawValue:rawStatus)!
        created = rawCreated
        name = rawName
        social = FDatabaseModelGandallerSocial(json:rawSocial)
        images = []
        powers = []
        videos = []
        
        for rawImage:String in rawImages
        {
            let image:FDatabaseModelGandallerImage = FDatabaseModelGandallerImage(imageid:rawImage)
            images.append(image)
        }
        
        for rawPower:String in rawPowers
        {
            let power:FDatabaseModelGandallerPower = FDatabaseModelGandallerPower(name:rawPower)
            powers.append(power)
        }
        
        for rawVideo:String in rawVideos
        {
            let video:FDatabaseModelGandallerVideo = FDatabaseModelGandallerVideo(url:rawVideo)
            videos.append(video)
        }
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
import UIKit

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
        case ImageId = "image_id"
        case ImageStatus = "image_status"
        case Powers = "powers"
        case Videos = "videos"
        case Social = "social"
        case Started = "started"
    }
    
    let status:FDatabaseModelGandallerStatus
    let created:NSTimeInterval
    let name:String
    let social:FDatabaseModelGandallerSocial
    let images:[FDatabaseModelGandallerImage]
    let powers:[FDatabaseModelGandallerPower]
    let videos:[FDatabaseModelGandallerVideo]
    let started:Bool
    
    class func withJson(json:[String:AnyObject]) -> FDatabaseModelGandaller
    {
        let gandaller:FDatabaseModelGandaller
        let rawStatus:Int = json[FDatabaseModelGandallerKey.Status.rawValue] as! Int
        let status:FDatabaseModelGandallerStatus = FDatabaseModelGandallerStatus(rawValue:rawStatus)!
        
        switch status
        {
            case FDatabaseModelGandallerStatus.Active:
            
                gandaller = FDatabaseModelGandallerActive(json:json)
                
                break
            
            case FDatabaseModelGandallerStatus.Paused:
                
                gandaller = FDatabaseModelGandallerPaused(json:json)
                
                break
        }
        
        return gandaller
    }
    
    init(status:FDatabaseModelGandallerStatus)
    {
        self.status = status
        created = NSDate().timeIntervalSince1970
        name = ""
        social = FDatabaseModelGandallerSocial()
        images = []
        powers = []
        videos = []
        started = false
    }
    
    init(status:FDatabaseModelGandallerStatus, json:[String:AnyObject])
    {
        let rawCreated:NSTimeInterval = json[FDatabaseModelGandallerKey.Created.rawValue] as! NSTimeInterval
        let rawName:String = json[FDatabaseModelGandallerKey.Name.rawValue] as! String
        let rawStarted:Bool = json[FDatabaseModelGandallerKey.Started.rawValue] as! Bool
        let rawSocial:[String:AnyObject]? = json[FDatabaseModelGandallerKey.Social.rawValue] as? [String:AnyObject]
        let rawImages:[[String:AnyObject]]? = json[FDatabaseModelGandallerKey.Images.rawValue] as? [[String:AnyObject]]
        let rawPowers:[String]? = json[FDatabaseModelGandallerKey.Powers.rawValue] as? [String]
        let rawVideos:[String]? = json[FDatabaseModelGandallerKey.Videos.rawValue] as? [String]
        
        self.status = status
        created = rawCreated
        name = rawName
        started = rawStarted
        social = FDatabaseModelGandallerSocial(json:rawSocial)
        var images:[FDatabaseModelGandallerImage] = []
        var powers:[FDatabaseModelGandallerPower] = []
        var videos:[FDatabaseModelGandallerVideo] = []
        
        if rawImages != nil
        {
            for rawImage:[String:AnyObject] in rawImages!
            {
                let image:FDatabaseModelGandallerImage = FDatabaseModelGandallerImage.withJson(rawImage)
                images.append(image)
            }
        }
        
        if rawPowers != nil
        {
            for rawPower:String in rawPowers!
            {
                let power:FDatabaseModelGandallerPower = FDatabaseModelGandallerPower(name:rawPower)
                powers.append(power)
            }
        }
        
        if rawVideos != nil
        {
            for rawVideo:String in rawVideos!
            {
                let video:FDatabaseModelGandallerVideo = FDatabaseModelGandallerVideo(url:rawVideo)
                videos.append(video)
            }
        }
        
        self.images = images
        self.powers = powers
        self.videos = videos
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
            FDatabaseModelGandallerKey.Started.rawValue:started,
            FDatabaseModelGandallerKey.Created.rawValue:created,
            FDatabaseModelGandallerKey.Social.rawValue:jsonSocial,
            FDatabaseModelGandallerKey.Images.rawValue:jsonImages,
            FDatabaseModelGandallerKey.Powers.rawValue:jsonPowers,
            FDatabaseModelGandallerKey.Videos.rawValue:jsonVideos,
        ]
        
        return json
    }
    
    func statusColor() -> UIColor
    {
        let color:UIColor = UIColor.clearColor()
        
        return color
    }
}
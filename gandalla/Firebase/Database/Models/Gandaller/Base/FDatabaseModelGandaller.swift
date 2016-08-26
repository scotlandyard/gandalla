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
        case ProfileImage = "profile_image"
        case Images = "images"
        case ImageStatus = "image_status"
        case ImageNotification = "image_notification"
        case Powers = "powers"
        case PowerName = "power_name"
        case PowerNotification = "power_notification"
        case Videos = "videos"
        case VideoUrl = "video_url"
        case VideoNotification = "video_notification"
        case Social = "social"
        case SocialFacebook = "social_facebook"
        case SocialTwitter = "social_twitter"
        case SocialInstagram = "social_instagram"
        case SocialHashtags = "social_hashtags"
        case SocialHashtagName = "social_hashtag_name"
        case Started = "started"
    }
    
    let status:FDatabaseModelGandallerStatus
    let created:NSTimeInterval
    let name:String
    let profileImage:String?
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
        profileImage = nil
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
        let rawProfileImage:String? = json[FDatabaseModelGandallerKey.ProfileImage.rawValue] as? String
        let rawSocial:[String:[String:AnyObject]]? = json[FDatabaseModelGandallerKey.Social.rawValue] as? [String:[String:AnyObject]]
        let rawImages:[String:[String:AnyObject]]? = json[FDatabaseModelGandallerKey.Images.rawValue] as? [String:[String:AnyObject]]
        let rawPowers:[String:[String:AnyObject]]? = json[FDatabaseModelGandallerKey.Powers.rawValue] as? [String:[String:AnyObject]]
        let rawVideos:[String:[String:AnyObject]]? = json[FDatabaseModelGandallerKey.Videos.rawValue] as? [String:[String:AnyObject]]
        
        self.status = status
        created = rawCreated
        name = rawName
        profileImage = rawProfileImage
        started = rawStarted
        social = FDatabaseModelGandallerSocial(json:rawSocial)
        var images:[FDatabaseModelGandallerImage] = []
        var powers:[FDatabaseModelGandallerPower] = []
        var videos:[FDatabaseModelGandallerVideo] = []
        
        if rawImages != nil
        {
            let rawImagesKeys:[String] = Array(rawImages!.keys)
            
            for rawImageKey:String in rawImagesKeys
            {
                let rawImage:[String:AnyObject] = rawImages![rawImageKey]!
                let image:FDatabaseModelGandallerImage = FDatabaseModelGandallerImage.withJson(rawImage, imageId:rawImageKey)
                images.append(image)
            }
        }
        
        if rawPowers != nil
        {
            let rawPowersKeys:[String] = Array(rawPowers!.keys)
            
            for rawPowerKey:String in rawPowersKeys
            {
                let rawPower:[String:AnyObject] = rawPowers![rawPowerKey]!
                let power:FDatabaseModelGandallerPower = FDatabaseModelGandallerPower(json:rawPower, powerId:rawPowerKey)
                powers.append(power)
            }
        }
        
        if rawVideos != nil
        {
            let rawVideosKeys:[String] = Array(rawVideos!.keys)
            
            for rawVideoKey:String in rawVideosKeys
            {
                let rawVideo:[String:AnyObject] = rawVideos![rawVideoKey]!
                let video:FDatabaseModelGandallerVideo = FDatabaseModelGandallerVideo(json:rawPower, videoId:rawVideoKey)
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
        var jsonImages:[String:[String:AnyObject]] = [:]
        var jsonPowers:[String] = []
        var jsonVideos:[String] = []
        
        for image:FDatabaseModelGandallerImage in images
        {
            let imageId:String? = image.imageId
            
            if imageId != nil
            {
                let imageJson:[String:AnyObject] = image.modelJson()
                jsonImages[imageId!] = imageJson
            }
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
        
        var json:[String:AnyObject] = [
            FDatabaseModelGandallerKey.Status.rawValue:status.rawValue,
            FDatabaseModelGandallerKey.Name.rawValue:name,
            FDatabaseModelGandallerKey.Started.rawValue:started,
            FDatabaseModelGandallerKey.Created.rawValue:created,
            FDatabaseModelGandallerKey.Social.rawValue:jsonSocial,
            FDatabaseModelGandallerKey.Images.rawValue:jsonImages,
            FDatabaseModelGandallerKey.Powers.rawValue:jsonPowers,
            FDatabaseModelGandallerKey.Videos.rawValue:jsonVideos,
        ]
        
        if profileImage != nil
        {
            json[FDatabaseModelGandallerKey.ProfileImage.rawValue] = profileImage!
        }
        
        return json
    }
    
    func statusColor() -> UIColor
    {
        fatalError()
    }
}
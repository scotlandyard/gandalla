import Foundation

class FDatabaseModelGandallerImage
{
    enum FDatabaseModelGandallerImageStatus:Int
    {
        case Waiting
        case Ready
    }
    
    let imageId:String
    let status:FDatabaseModelGandallerImageStatus
    
    class func withJson(json:[String:AnyObject], imageId:String) -> FDatabaseModelGandallerImage
    {
        let image:FDatabaseModelGandallerImage
        let imageStatusKey:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.ImageStatus.rawValue
        let rawStatus:Int = json[imageStatusKey] as! Int
        let status:FDatabaseModelGandallerImageStatus = FDatabaseModelGandallerImageStatus(rawValue:rawStatus)!
        
        switch status
        {
            case FDatabaseModelGandallerImageStatus.Waiting:
                
                image = FDatabaseModelGandallerImageWaiting(imageId:imageId)
                
                break
                
            case FDatabaseModelGandallerImageStatus.Ready:
                
                image = FDatabaseModelGandallerImageReady(imageId:imageId)
                
                break
        }
        
        return image
    }
    
    init(imageId:String, status:FDatabaseModelGandallerImageStatus)
    {
        self.imageId = imageId
        self.status = status
    }
    
    //MARK: public
    
    func modelJson() -> [String:AnyObject]
    {
        var json:[String:AnyObject] = [:]
//        
//        for hashtag:FDatabaseModelGandallerSocialHashtag in hashtags
//        {
//            let hashString:String = hashtag.tag
//            hashArray.append(hashString)
//        }
//        
//        var json:[String:AnyObject] = [:]
//        json[FDatabaseModelGandallerSocial.Hashtags.rawValue] = hashArray
//        
//        if facebook != nil
//        {
//            json[FDatabaseModelGandallerSocial.Facebook.rawValue] = facebook!
//        }
//        
//        if twitter != nil
//        {
//            json[FDatabaseModelGandallerSocial.Twitter.rawValue] = twitter!
//        }
//        
//        if instagram != nil
//        {
//            json[FDatabaseModelGandallerSocial.Instagram.rawValue] = instagram!
//        }
        
        return json
    }
}
import Foundation

class FDatabaseModelGandallerSocial
{
    var facebook:String?
    var twitter:String?
    var instagram:String?
    var hashtags:[FDatabaseModelGandallerSocialHashtag]
    
    enum FDatabaseModelGandallerSocial:String
    {
        case Facebook = "facebook"
        case Twitter = "twitter"
        case Instagram = "instagram"
        case Hashtags = "hashtags"
    }
    
    init()
    {
        hashtags = []
    }
    
    func modelJson() -> [String:AnyObject]
    {
        var hashArray:[String] = []
        
        for hashtag:FDatabaseModelGandallerSocialHashtag in hashtags
        {
            let hashString:String = hashtag.tag
            hashArray.append(hashString)
        }
        
        var json:[String:AnyObject] = [:]
        json[FDatabaseModelGandallerSocial.Hashtags.rawValue] = hashArray
        
        if facebook != nil
        {
            json[FDatabaseModelGandallerSocial.Facebook.rawValue] = facebook!
        }
        
        if twitter != nil
        {
            json[FDatabaseModelGandallerSocial.Twitter.rawValue] = twitter!
        }
        
        if instagram != nil
        {
            json[FDatabaseModelGandallerSocial.Instagram.rawValue] = instagram!
        }
        
        return json
    }
}
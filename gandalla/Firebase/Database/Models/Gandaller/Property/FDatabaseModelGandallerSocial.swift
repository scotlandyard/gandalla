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
    
    init(json:[String:AnyObject]?)
    {
        hashtags = []
        
        if json != nil
        {
            let rawFacebook:String? = json![FDatabaseModelGandallerSocial.Facebook.rawValue] as? String
            let rawTwitter:String? = json![FDatabaseModelGandallerSocial.Twitter.rawValue] as? String
            let rawInstagram:String? = json![FDatabaseModelGandallerSocial.Instagram.rawValue] as? String
            let rawHashtags:[String] = json![FDatabaseModelGandallerSocial.Hashtags.rawValue] as! [String]
            
            facebook = rawFacebook
            twitter = rawTwitter
            instagram = rawInstagram
            
            for rawHashtag:String in rawHashtags
            {
                let hashtag:FDatabaseModelGandallerSocialHashtag = FDatabaseModelGandallerSocialHashtag(tag:rawHashtag)
                hashtags.append(hashtag)
            }
        }
    }
    
    //MARK: public
    
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
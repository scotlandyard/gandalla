import Foundation

class FDatabaseModelGandallerSocial
{
    var facebook:String
    var twitter:String
    var instagram:String
    var hashtags:[FDatabaseModelGandallerSocialHashtag]
    
    init()
    {
        hashtags = []
        facebook = ""
        twitter = ""
        instagram = ""
    }
    
    init(json:[String:AnyObject]?)
    {
        hashtags = []
        
        if json != nil
        {
            let rawFacebook:String = json![FDatabaseModelGandaller.FDatabaseModelGandallerKey.SocialFacebook.rawValue] as! String
            let rawTwitter:String = json![FDatabaseModelGandaller.FDatabaseModelGandallerKey.SocialTwitter.rawValue] as! String
            let rawInstagram:String = json![FDatabaseModelGandaller.FDatabaseModelGandallerKey.SocialInstagram.rawValue] as! String
            let rawHashtags:[String:AnyObject]? = json![FDatabaseModelGandaller.FDatabaseModelGandallerKey.SocialHashtags.rawValue] as? [String:AnyObject]
            
            facebook = rawFacebook
            twitter = rawTwitter
            instagram = rawInstagram
            
            if rawHashtags != nil
            {
                let hashtagsKeys:[String] = Array(rawHashtags!.keys)
                
                for hashtagKey:String in hashtagsKeys
                {
                    let rawHashtag:[String:AnyObject] = rawHashtags![hashtagKey] as! [String:AnyObject]
                    let tag:String = rawHashtag[FDatabaseModelGandaller.FDatabaseModelGandallerKey.SocialHashtagName.rawValue] as! String
                    let hashtag:FDatabaseModelGandallerSocialHashtag = FDatabaseModelGandallerSocialHashtag(tag:tag, hashtagId:hashtagKey)
                    hashtags.append(hashtag)
                }
            }
        }
        else
        {
            facebook = ""
            twitter = ""
            instagram = ""
        }
    }
    
    //MARK: public
    
    func modelJson() -> [String:AnyObject]
    {
        var hashtagsJson:[[String:AnyObject]] = []
        
        for hashtag:FDatabaseModelGandallerSocialHashtag in hashtags
        {
            let hashJson:[String:AnyObject] = hashtag.modelJson()
            hashtagsJson.append(hashJson)
        }
        
        var json:[String:AnyObject] = [:]
        json[FDatabaseModelGandaller.FDatabaseModelGandallerKey.SocialHashtags.rawValue] = hashtagsJson
        json[FDatabaseModelGandaller.FDatabaseModelGandallerKey.SocialFacebook.rawValue] = facebook
        json[FDatabaseModelGandaller.FDatabaseModelGandallerKey.SocialTwitter.rawValue] = twitter
        json[FDatabaseModelGandaller.FDatabaseModelGandallerKey.SocialInstagram.rawValue] = instagram
        
        return json
    }
}
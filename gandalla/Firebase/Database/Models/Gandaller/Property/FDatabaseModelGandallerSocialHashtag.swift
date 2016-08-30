import Foundation

class FDatabaseModelGandallerSocialHashtag
{
    var tag:String
    var hashtagId:String?
    
    init()
    {
        self.tag = ""
    }
    
    init(tag:String, hashtagId:String)
    {
        self.tag = tag
        self.hashtagId = hashtagId
    }
    
    //MARK: public
    
    func modelJson() -> [String:AnyObject]
    {
        let json:[String:AnyObject] = [
            FDatabaseModelGandaller.FDatabaseModelGandallerKey.SocialHashtagName.rawValue:tag
        ]
        
        return json
    }
}
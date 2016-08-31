import Foundation

class FDatabaseModelGandallerSocialHashtag
{
    var hashtagId:String
    var tag:String
    private let kHashtagId:String = ""
    private let kEmpty:String = ""
    
    init()
    {
        tag = kEmpty
        hashtagId = kHashtagId
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
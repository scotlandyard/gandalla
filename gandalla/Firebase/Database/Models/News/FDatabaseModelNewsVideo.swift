import UIKit

class FDatabaseModelNewsVideo:FDatabaseModelNews
{
    let url:String
    private let kCellHeight:CGFloat = 50
    
    init(gandallerId:String, url:String)
    {
        let newsType:FDatabaseModelNewsType = FDatabaseModelNewsType.Video
        self.url = url
        super.init(newsType:newsType, gandallerId:gandallerId)
    }
    
    init(json:[String:AnyObject])
    {
        let newsType:FDatabaseModelNewsType = FDatabaseModelNewsType.Video
        let rawUrl:String = json[FDatabaseModelNewsKey.Url.rawValue] as! String
        url = rawUrl
        
        super.init(newsType:newsType, json:json)
    }
    
    override func modelJson() -> [String:AnyObject]
    {
        var json:[String:AnyObject] = super.modelJson()
        json[FDatabaseModelNewsKey.Url.rawValue] = url
        
        return json
    }
    
    override func cellHeight() -> CGFloat
    {
        return kCellHeight
    }
    
    override func reusableIdentifier() -> String
    {
        let identifier:String = VNewsCellJoined.reusableIdentifier()
        
        return identifier
    }
}
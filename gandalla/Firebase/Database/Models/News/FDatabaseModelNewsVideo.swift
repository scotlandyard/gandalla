import Foundation

class FDatabaseModelNewsVideo:FDatabaseModelNews
{
    let url:String
    
    init(gandallerId:String, url:String)
    {
        let newsType:FDatabaseModelNewsType = FDatabaseModelNewsType.Video
        self.url = url
        super.init(newsType:newsType, gandallerId:gandallerId)
    }
    
    init(json:[String:AnyObject])
    {
        let newsType:FDatabaseModelNewsType = FDatabaseModelNewsType.Video
        url = json[FDatabaseModelNewsKey.Url.rawValue] as! String
        super.init(newsType:newsType, json:json)
    }
    
    override func modelJson() -> [String:AnyObject]
    {
        var json:[String:AnyObject] = super.modelJson()
        json[FDatabaseModelNewsKey.Url.rawValue] = url
        
        return json
    }
}
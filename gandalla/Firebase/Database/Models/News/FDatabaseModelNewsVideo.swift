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
    
    override func modelJson() -> [String:AnyObject]
    {
        var json:[String:AnyObject] = super.modelJson()
        json[FDatabaseModelNewsKey.Url.rawValue] = url
        
        return json
    }
}
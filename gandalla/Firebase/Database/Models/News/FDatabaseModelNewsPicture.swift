import Foundation

class FDatabaseModelNewsPicture:FDatabaseModelNews
{
    let pictureId:String
    
    init(gandallerId:String, pictureId:String)
    {
        let newsType:FDatabaseModelNewsType = FDatabaseModelNewsType.Picture
        self.pictureId = pictureId
        super.init(newsType:newsType, gandallerId:gandallerId)
    }
    
    init(json:[String:AnyObject])
    {
        let newsType:FDatabaseModelNewsType = FDatabaseModelNewsType.Picture
        let rawPictureId:String = json[FDatabaseModelNewsKey.PictureId.rawValue] as! String
        pictureId = rawPictureId
        
        super.init(newsType:newsType, json:json)
    }
    
    override func modelJson() -> [String:AnyObject]
    {
        var json:[String:AnyObject] = super.modelJson()
        json[FDatabaseModelNewsKey.PictureId.rawValue] = pictureId
        
        return json
    }
}
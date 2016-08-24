import UIKit

class FDatabaseModelNewsSocial:FDatabaseModelNews
{
    private let kCellHeight:CGFloat = 40
    
    init(gandallerId:String)
    {
        let newsType:FDatabaseModelNewsType = FDatabaseModelNewsType.Social
        super.init(newsType:newsType, gandallerId:gandallerId)
    }
    
    init(json:[String:AnyObject])
    {
        let newsType:FDatabaseModelNewsType = FDatabaseModelNewsType.Social
        super.init(newsType:newsType, json:json)
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
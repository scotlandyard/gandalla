import UIKit

class FDatabaseModelNewsJoined:FDatabaseModelNews
{
    private let kCellHeight:CGFloat = 70
    
    init(gandallerId:String)
    {
        let newsType:FDatabaseModelNewsType = FDatabaseModelNewsType.Joined
        super.init(newsType:newsType, gandallerId:gandallerId)
    }
    
    init(json:[String:AnyObject])
    {
        let newsType:FDatabaseModelNewsType = FDatabaseModelNewsType.Joined
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
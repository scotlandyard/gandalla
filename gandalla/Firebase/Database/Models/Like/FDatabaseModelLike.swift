import Foundation

class FDatabaseModelLike:FDatabaseModel
{
    let userId:String
    
    enum FDatabaseModelLikeKey:String
    {
        case Received = "received"
        case UserId = "user_id"
    }
    
    init(userId:String)
    {
        self.userId = userId
    }
    
    //MARK: public
    
    func modelJson() -> [String:AnyObject]
    {
        let dict:[String:AnyObject] = [
            FDatabaseModelLikeKey.UserId.rawValue:userId
        ]
        
        return dict
    }
}
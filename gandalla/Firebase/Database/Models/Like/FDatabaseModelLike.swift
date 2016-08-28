import Foundation

class FDatabaseModelLike:FDatabaseModel
{
    let gandallerId:String
    let userId:String
    
    enum FDatabaseModelLikeKey:String
    {
        case GandallerId = "gandaller_id"
        case UserId = "user_id"
    }
    
    init(gandallerId:String, userId:String)
    {
        self.gandallerId = gandallerId
        self.userId = userId
    }
    
    //MARK: public
    
    func modelJson() -> [String:AnyObject]
    {
        let dict:[String:AnyObject] = [
            FDatabaseModelLikeKey.GandallerId.rawValue:gandallerId,
            FDatabaseModelLikeKey.UserId.rawValue:userId
        ]
        
        return dict
    }
}
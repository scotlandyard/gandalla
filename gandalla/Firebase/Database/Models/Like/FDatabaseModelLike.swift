import Foundation

class FDatabaseModelLike:FDatabaseModel
{
    let count:Int
    
    enum FDatabaseModelLikeKey:String
    {
        case Count = "count"
    }
    
    init(json:[String:AnyObject]?)
    {
        if json == nil
        {
            count = 1
        }
        else
        {
            let prevCount:Int = json![FDatabaseModelLikeKey.Count.rawValue] as! Int
            count = prevCount + 1
        }
    }
    
    //MARK: public
    
    func modelJson() -> [String:AnyObject]
    {
        let dict:[String:AnyObject] = [
            FDatabaseModelLikeKey.Count.rawValue:count
        ]
        
        return dict
    }
}
import Foundation

class FDatabaseModelNewsPower:FDatabaseModelNews
{
    let power:String
    
    init(gandallerId:String, power:String)
    {
        let newsType:FDatabaseModelNewsType = FDatabaseModelNewsType.Power
        self.power = power
        super.init(newsType:newsType, gandallerId:gandallerId)
    }
    
    override func modelJson() -> [String:AnyObject]
    {
        var json:[String:AnyObject] = super.modelJson()
        json[FDatabaseModelNewsKey.Power.rawValue] = power
        
        return json
    }
}
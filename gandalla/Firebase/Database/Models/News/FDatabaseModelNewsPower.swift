import UIKit

class FDatabaseModelNewsPower:FDatabaseModelNews
{
    let power:String
    private let kCellHeight:CGFloat = 100
    
    init(gandallerId:String, power:String)
    {
        let newsType:FDatabaseModelNewsType = FDatabaseModelNewsType.Power
        self.power = power
        super.init(newsType:newsType, gandallerId:gandallerId)
    }
    
    init(json:[String:AnyObject])
    {
        let newsType:FDatabaseModelNewsType = FDatabaseModelNewsType.Power
        let rawPower:String = json[FDatabaseModelNewsKey.Power.rawValue] as! String
        power = rawPower
        
        super.init(newsType:newsType, json:json)
    }
    
    override func modelJson() -> [String:AnyObject]
    {
        var json:[String:AnyObject] = super.modelJson()
        json[FDatabaseModelNewsKey.Power.rawValue] = power
        
        return json
    }
    
    override func cellHeight() -> CGFloat
    {
        return kCellHeight
    }
    
    override func reusableIdentifier() -> String
    {
        let identifier:String = VNewsCellPower.reusableIdentifier()
        
        return identifier
    }
}
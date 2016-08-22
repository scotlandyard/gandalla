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
}
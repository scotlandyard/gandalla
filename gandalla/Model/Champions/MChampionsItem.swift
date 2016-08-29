import Foundation

class MChampionsItem
{
    let count:Int
    weak var modelGandaller:MGandallerItem!
    
    init(gandallerId:String, count:Int)
    {
        self.count = count
        self.modelGandaller = MGandaller.sharedInstance.items[gandallerId]
    }
}
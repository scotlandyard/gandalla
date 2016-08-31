import Foundation

class MChampionsItem
{
    let count:Int
    var percentage:Double
    weak var modelGandaller:MGandallerItem!
    
    init(modelGandaller:MGandallerItem, count:Int)
    {
        self.count = count
        self.modelGandaller = modelGandaller
        percentage = 0
    }
}
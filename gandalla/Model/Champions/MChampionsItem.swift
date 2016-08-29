import Foundation

class MChampionsItem
{
    let count:Int
    weak var modelGandaller:MGandallerItem!
    
    init(modelGandaller:MGandallerItem, count:Int)
    {
        self.count = count
        self.modelGandaller = modelGandaller
    }
}
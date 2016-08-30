import Foundation

class MChampionsItem
{
    let percentage:Double
    weak var modelGandaller:MGandallerItem!
    
    init(modelGandaller:MGandallerItem, percentage:Double)
    {
        self.percentage = percentage
        self.modelGandaller = modelGandaller
    }
}
import Foundation

class MLikedItem
{
    weak var modelGandaller:MGandallerItem!
    let created:NSTimeInterval
    
    init(modelGandaller:MGandallerItem, created:NSTimeInterval)
    {
        self.modelGandaller = modelGandaller
        self.created = created
    }
}
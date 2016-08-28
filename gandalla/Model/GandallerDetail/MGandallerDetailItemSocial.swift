import UIKit

class MGandallerDetailItemSocial:MGandallerDetailItem
{
    private let kCellHeight:CGFloat = 70
    weak var modelGandaller:MGandallerItem!
    
    init(modelGandaller:MGandallerItem)
    {
        self.modelGandaller = modelGandaller
        let reusableIdentifier:String = VGandallerDetailCellSocial.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
}
import UIKit

class MGandallerDetailItemSocial:MGandallerDetailItem
{
    weak var modelGandaller:MGandallerItem!
    private let kCellHeight:CGFloat = 70
    private let kSelectable:Bool = false
    
    init(modelGandaller:MGandallerItem)
    {
        self.modelGandaller = modelGandaller
        let reusableIdentifier:String = VGandallerDetailCellSocial.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight, selectable:kSelectable)
    }
}
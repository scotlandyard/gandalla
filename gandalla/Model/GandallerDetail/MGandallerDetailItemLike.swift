import UIKit

class MGandallerDetailItemLike:MGandallerDetailItem
{
    weak var modelGandaller:MGandallerItem!
    private let kCellHeight:CGFloat = 60
    private let kSelectable:Bool = false
    
    init(modelGandaller:MGandallerItem)
    {
        self.modelGandaller = modelGandaller
        let reusableIdentifier:String = VGandallerDetailCellLike.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight, selectable:kSelectable)
    }
}
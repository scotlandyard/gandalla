import UIKit

class MGandallerDetailItemProfile:MGandallerDetailItem
{
    weak var modelGandaller:MGandallerItem!
    private let kCellHeight:CGFloat = 40
    private let kSelectable:Bool = false
    
    init(modelGandaller:MGandallerItem)
    {
        self.modelGandaller = modelGandaller
        let reusableIdentifier:String = VGandallerDetailCellProfile.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight, selectable:kSelectable)
    }
}
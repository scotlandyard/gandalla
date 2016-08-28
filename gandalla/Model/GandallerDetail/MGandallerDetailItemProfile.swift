import UIKit

class MGandallerDetailItemProfile:MGandallerDetailItem
{
    private let kCellHeight:CGFloat = 100
    weak var modelGandaller:MGandallerItem!
    
    init(modelGandaller:MGandallerItem)
    {
        self.modelGandaller = modelGandaller
        let reusableIdentifier:String = VGandallerDetailCellProfile.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
}
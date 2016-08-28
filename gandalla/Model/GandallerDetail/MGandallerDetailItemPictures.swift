import UIKit

class MGandallerDetailItemPictures:MGandallerDetailItem
{
    let gandallerId:String
    private let kSelectable:Bool = false
    
    init(gandallerId:String)
    {
        self.gandallerId = gandallerId
        let cellHeight:CGFloat
        let reusableIdentifier:String = VGandallerDetailCellPictures.reusableIdentifier()
        let screenSize:CGSize = UIScreen.mainScreen().bounds.size
        let screenWidth:CGFloat = screenSize.width
        let screenHeight:CGFloat = screenSize.height
        
        if screenWidth < screenHeight
        {
            cellHeight = screenWidth
        }
        else
        {
            cellHeight = screenHeight
        }
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:cellHeight, selectable:kSelectable)
    }
}
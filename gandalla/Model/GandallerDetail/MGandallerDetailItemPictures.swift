import UIKit

class MGandallerDetailItemPictures:MGandallerDetailItem
{
    init()
    {
        let cellHeight:CGFloat
        let reusableIdentifier:String = ""
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
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:cellHeight)
    }
}
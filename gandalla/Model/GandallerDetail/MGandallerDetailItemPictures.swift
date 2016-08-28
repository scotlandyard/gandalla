import UIKit

class MGandallerDetailItemPictures:MGandallerDetailItem
{
    let gandallerId:String
    let cellSize:CGFloat
    var items:[]
    private let kSelectable:Bool = false
    
    init(gandallerId:String)
    {
        self.gandallerId = gandallerId
        let reusableIdentifier:String = VGandallerDetailCellPictures.reusableIdentifier()
        let screenSize:CGSize = UIScreen.mainScreen().bounds.size
        let screenWidth:CGFloat = screenSize.width
        let screenHeight:CGFloat = screenSize.height
        
        if screenWidth < screenHeight
        {
            cellSize = screenWidth
        }
        else
        {
            cellSize = screenHeight
        }
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:cellSize, selectable:kSelectable)
    }
}
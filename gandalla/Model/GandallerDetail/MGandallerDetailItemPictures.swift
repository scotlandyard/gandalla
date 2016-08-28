import UIKit

class MGandallerDetailItemPictures:MGandallerDetailItem
{
    let cellSize:CGFloat
    let items:[MGandallerDetailItemPicturesItem]
    private let kSelectable:Bool = false
    
    init(modelGandaller:MGandallerItem)
    {
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
        
        let items:[MGandallerDetailItemPicturesItem] = []
        
        for fImage:FDatabaseModelGandallerImage in modelGandaller.fModel.images
        {
            
        }
        
        self.items = items
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:cellSize, selectable:kSelectable)
    }
}
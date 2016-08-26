import UIKit

class MGandallerListItem
{
    weak var fGandaller:FDatabaseModelGandaller?
    
    init(fGandaller:FDatabaseModelGandaller)
    {
        self.fGandaller = fGandaller
    }
    
    //MARK: public
    
    func heightForWidth(width:CGFloat) -> CGFloat
    {
        return 0
    }
    
    func config(cell:VGandallersCell)
    {
        
    }
}
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
        return 100
    }
    
    func config(cell:VGandallersCell)
    {
        
    }
}
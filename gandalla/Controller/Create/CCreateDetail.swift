import UIKit

class CCreateDetail:CMainController
{
    weak var model:MCreateItem!
    
    convenience init(model:MCreateItem)
    {
        self.init()
        self.model = model
    }
}
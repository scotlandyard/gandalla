import UIKit

class MCreateItemDetailPropertyItem
{
    weak var controller:CCreateDetail!
    
    //MARK: public
    
    func config(controller:CCreateDetail, cell:VCreateDetailCell)
    {
        self.controller = controller
    }
}
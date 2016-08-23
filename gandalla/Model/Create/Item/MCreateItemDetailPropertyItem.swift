import UIKit

class MCreateItemDetailPropertyItem:NSObject
{
    weak var controller:CCreateDetail!
    
    //MARK: public
    
    func config(controller:CCreateDetail, cell:VCreateDetailCell)
    {
        self.controller = controller
    }
}
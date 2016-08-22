import UIKit

class MCreateItemDetailProperty
{
    weak var controller:CCreateDetail!
    let reusableIdentifier:String
    let cellHeight:CGFloat
    
    //MARK: public
    
    func config(controller:CCreateDetail, cell:VCreateDetailCell)
    {
        self.controller = controller
    }
}
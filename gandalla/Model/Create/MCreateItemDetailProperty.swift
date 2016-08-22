import UIKit

class MCreateItemDetailProperty
{
    weak var controller:CCreateDetail!
    let reusableIdentifier:String
    let cellHeight:CGFloat
    
    init(reusableIdentifier:String, cellHeight:CGFloat)
    {
        self.reusableIdentifier = reusableIdentifier
        self.cellHeight = cellHeight
    }
    
    //MARK: public
    
    func config(controller:CCreateDetail, cell:VCreateDetailCell)
    {
        self.controller = controller
    }
}
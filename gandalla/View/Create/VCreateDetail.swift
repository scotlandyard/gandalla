import UIKit

class VCreateDetail:UIView
{
    weak var controller:CCreateDetail!
    
    convenience init(controller:CCreateDetail)
    {
        self.init()
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
    }
}
import UIKit

class VNews:UIView
{
    weak var controller:CNews!
    
    convenience init(controller:CNews)
    {
        self.init()
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
    }
}
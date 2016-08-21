import UIKit

class VCreate:UIView
{
    weak var controller:CCreate!
    
    convenience init(controller:CCreate)
    {
        self.init()
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.complement()
        self.controller = controller
    }
}
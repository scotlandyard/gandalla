import UIKit

class VGandallerDetail:UIView
{
    weak var controller:CGandallerDetail!
    
    convenience init(controller:CGandallerDetail)
    {
        self.init()
        self.controller = controller
        clipsToBounds = true
        backgroundColor = UIColor.collectionBackground()
        translatesAutoresizingMaskIntoConstraints = false
    }
}
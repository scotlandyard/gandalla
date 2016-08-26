import UIKit

class VGandallers:UIView
{
    weak var controller:CGandallers!
    
    convenience init(controller:CGandallers)
    {
        self.init()
        self.controller = controller
        clipsToBounds = true
        backgroundColor = UIColor.collectionBackground()
        translatesAutoresizingMaskIntoConstraints = false
    }
}

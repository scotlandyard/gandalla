import UIKit

class VGandallerDetail:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewFlowLayout
{
    weak var controller:CGandallerDetail!
    weak var collection:UICollectionView!
    
    convenience init(controller:CGandallerDetail)
    {
        self.init()
        self.controller = controller
        clipsToBounds = true
        backgroundColor = UIColor.collectionBackground()
        translatesAutoresizingMaskIntoConstraints = false
    }
}
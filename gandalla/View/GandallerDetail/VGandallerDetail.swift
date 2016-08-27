import UIKit

class VGandallerDetail:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
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
    
    //MARK: collection del
    
    func numberOfSectionsInCollectionView(collectionView:UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        return 0
    }
    
    func collectionView(collectionView:UICollectionView, cellForItemAtIndexPath indexPath:NSIndexPath) -> UICollectionViewCell
    {
        
    }
}
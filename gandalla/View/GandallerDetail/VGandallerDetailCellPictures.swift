import UIKit

class VGandallerDetailCellPictures:VGandallerDetailCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
    }
    
    required init?(coder:NSCoder)
    {
        super.init(coder:coder)
    }
    
    //MARK: collection del
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return 1
    }
}
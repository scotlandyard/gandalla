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
    
    //MARK: private
    
    
    
    //MARK: collection del
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        return 0
    }
    
    func collectionView(collectionView:UICollectionView, cellForItemAtIndexPath indexPath:NSIndexPath) -> UICollectionViewCell
    {
        let cell:VGandallerDetailCellPicturesCell = collectionView.dequeueReusableCellWithReuseIdentifier(
            VGandallerDetailCellPicturesCell.reusableIdentifier(),
            forIndexPath:
            indexPath) as! VGandallerDetailCellPicturesCell
        
        return cell
    }
}
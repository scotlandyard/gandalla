import UIKit

class VGandallerDetail:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    weak var controller:CGandallerDetail!
    weak var collection:UICollectionView!
    private let kCollectionTop:CGFloat = 64
    private let kCollectionBottom:CGFloat = 40
    private let kInterLine:CGFloat = 1
    
    convenience init(controller:CGandallerDetail)
    {
        self.init()
        self.controller = controller
        clipsToBounds = true
        backgroundColor = UIColor.collectionBackground()
        translatesAutoresizingMaskIntoConstraints = false
        
        let flow:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flow.headerReferenceSize = CGSizeZero
        flow.footerReferenceSize = CGSizeZero
        flow.sectionInset = UIEdgeInsetsMake(kCollectionTop, 0, kCollectionBottom, 0)
        flow.minimumLineSpacing = kInterLine
        flow.minimumInteritemSpacing = 0
        flow.scrollDirection = UICollectionViewScrollDirection.Vertical
        
        let collection:UICollectionView = UICollectionView(frame:CGRectZero, collectionViewLayout:flow)
        collection.clipsToBounds = true
        collection.backgroundColor = UIColor.clearColor()
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.alwaysBounceVertical = true
        collection.delegate = self
        collection.dataSource = self
        collection.registerClass(
            VGandallerDetailCellPictures.self,
            forCellWithReuseIdentifier:
            VGandallerDetailCellPictures.reusableIdentifier())
        collection.registerClass(
            VGandallerDetailCellProfile.self,
            forCellWithReuseIdentifier:
            VGandallerDetailCellProfile.reusableIdentifier())
        collection.registerClass(
            VGandallerDetailCellPower.self,
            forCellWithReuseIdentifier:
            VGandallerDetailCellPower.reusableIdentifier())
        collection.registerClass(
            VGandallerDetailCellSocial.self,
            forCellWithReuseIdentifier:
            VGandallerDetailCellSocial.reusableIdentifier())
        collection.registerClass(
            VGandallerDetailCellHashtag.self,
            forCellWithReuseIdentifier:
            VGandallerDetailCellHashtag.reusableIdentifier())
        collection.registerClass(
            VGandallerDetailCellVideo.self,
            forCellWithReuseIdentifier:
            VGandallerDetailCellVideo.reusableIdentifier())
        self.collection = collection
        
        addSubview(collection)
        
        let views:[String:AnyObject] = [
            "collection":collection]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[collection]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[collection]-0-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    override func layoutSubviews()
    {
        collection.collectionViewLayout.invalidateLayout()
        
        super.layoutSubviews()
    }
    
    //MARK: private
    
    private func modelAtIndex(index:NSIndexPath) -> MGandallerDetailItem
    {
        let item:MGandallerDetailItem = controller.model.items[index.item]
        
        return item
    }
    
    //MARK: collection del
    
    func scrollViewDidScroll(scrollView:UIScrollView)
    {
        controller.parent.scrollDidScroll(scrollView)
    }
    
    func collectionView(collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize
    {
        let item:MGandallerDetailItem = modelAtIndex(indexPath)
        let width:CGFloat = collectionView.bounds.size.width
        let size:CGSize = CGSizeMake(width, item.cellHeight)
        
        return size
    }
    
    func numberOfSectionsInCollectionView(collectionView:UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        let count:Int = controller.model.items.count
        
        return count
    }
    
    func collectionView(collectionView:UICollectionView, cellForItemAtIndexPath indexPath:NSIndexPath) -> UICollectionViewCell
    {
        let item:MGandallerDetailItem = modelAtIndex(indexPath)
        let cell:VGandallerDetailCell = collectionView.dequeueReusableCellWithReuseIdentifier(
            item.reusableIdentifier,
            forIndexPath:
            indexPath) as! VGandallerDetailCell
        cell.config(item)
        
        return cell
    }
    
    func collectionView(collectionView:UICollectionView, shouldHighlightItemAtIndexPath indexPath:NSIndexPath) -> Bool
    {
        let item:MGandallerDetailItem = modelAtIndex(indexPath)
        
        return item.selectable
    }
    
    func collectionView(collectionView:UICollectionView, shouldSelectItemAtIndexPath indexPath:NSIndexPath) -> Bool
    {
        let item:MGandallerDetailItem = modelAtIndex(indexPath)
        
        return item.selectable
    }
    
    func collectionView(collectionView:UICollectionView, didSelectItemAtIndexPath indexPath:NSIndexPath)
    {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_SEC)), dispatch_get_main_queue())
        { [weak collectionView] in
            
            collectionView?.selectItemAtIndexPath(nil, animated:false, scrollPosition:UICollectionViewScrollPosition.None)
        }
    }
}
import UIKit

class VGandallerDetailCellPictures:VGandallerDetailCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    let imageSize:CGFloat
    weak var collection:UICollectionView!
    weak var modelPictures:MGandallerDetailItemPictures?
    weak var pageControl:UIPageControl!
    private let kPageControlBottom:Int = 50
    
    override init(frame:CGRect)
    {
        imageSize = frame.size.height
        
        super.init(frame:frame)
        
        let border:UIView = UIView()
        border.userInteractionEnabled = false
        border.translatesAutoresizingMaskIntoConstraints = false
        border.backgroundColor = UIColor(white:0.9, alpha:1)
        
        let flow:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flow.headerReferenceSize = CGSizeZero
        flow.footerReferenceSize = CGSizeZero
        flow.itemSize = CGSizeMake(imageSize, imageSize)
        flow.minimumInteritemSpacing = 0
        flow.minimumLineSpacing = 0
        flow.scrollDirection = UICollectionViewScrollDirection.Horizontal
        
        let collection:UICollectionView = UICollectionView(frame:CGRectZero, collectionViewLayout:flow)
        collection.clipsToBounds = true
        collection.backgroundColor = UIColor.clearColor()
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.alwaysBounceHorizontal = true
        collection.pagingEnabled = true
        collection.delegate = self
        collection.dataSource = self
        collection.registerClass(
            VGandallerDetailCellPicturesCell.self,
            forCellWithReuseIdentifier:
            VGandallerDetailCellPicturesCell.reusableIdentifier())
        self.collection = collection
        
        let pageControl:UIPageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.backgroundColor = UIColor.clearColor()
        pageControl.currentPageIndicatorTintColor = UIColor.complement()
        pageControl.pageIndicatorTintColor = UIColor.whiteColor()
        pageControl.addTarget(self, action:#selector(self.actionPageSelected(sender:)), forControlEvents:UIControlEvents.ValueChanged)
        self.pageControl = pageControl
        
        addSubview(border)
        addSubview(collection)
        addSubview(pageControl)
        
        let views:[String:AnyObject] = [
            "border":border,
            "collection":collection,
            "pageControl":pageControl]
        
        let metrics:[String:AnyObject] = [
            "pageControlBottom":kPageControlBottom]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[border]-0-|",
            options:[],
            metrics:metrics,
            views:views))
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
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[pageControl]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[pageControl(pageControlBottom)]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[border(1)]-0-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func config(model:MGandallerDetailItem)
    {
        modelPictures = model as? MGandallerDetailItemPictures
        pageControl.numberOfPages = modelPictures!.items.count
        
        collection.reloadData()
    }
    
    override func layoutSubviews()
    {
        collection.collectionViewLayout.invalidateLayout()
        super.layoutSubviews()
    }
    
    //MARK: actions
    
    func actionPageSelected(sender pageControl:UIPageControl)
    {
        let selected:Int = pageControl.currentPage
        let indexPath:NSIndexPath = NSIndexPath(forItem:selected, inSection:0)
        collection.scrollToItemAtIndexPath(indexPath, atScrollPosition:UICollectionViewScrollPosition.CenteredHorizontally, animated:true)
    }
    
    //MARK: private
    
    private func modelAtIndex(index:NSIndexPath) -> MGandallerDetailItemPicturesItem
    {
        let item:MGandallerDetailItemPicturesItem = modelPictures!.items[index.item]
        
        return item
    }
    
    //MARK: collection del
    
    func scrollViewDidScroll(scrollView:UIScrollView)
    {
        let scrollX:CGFloat = scrollView.contentOffset.x
        let totalX:CGFloat = scrollView.center.x + scrollX
        let point:CGPoint = CGPointMake(totalX, 1)
        let index:NSIndexPath? = collection.indexPathForItemAtPoint(point)
        
        if index != nil
        {
            let item:Int = index!.item
            pageControl.currentPage = item
        }
    }
    
    func collectionView(collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, insetForSectionAtIndex section:Int) -> UIEdgeInsets
    {
        let colWidth:CGFloat = bounds.maxX
        let remain:CGFloat = colWidth - imageSize
        let margin:CGFloat = remain / 2.0
        let insets:UIEdgeInsets = UIEdgeInsetsMake(0, margin, 0, margin)
        
        return insets
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        let count:Int
        
        if modelPictures == nil
        {
            count = 0
        }
        else
        {
            count = modelPictures!.items.count
        }
        
        return count
    }
    
    func collectionView(collectionView:UICollectionView, cellForItemAtIndexPath indexPath:NSIndexPath) -> UICollectionViewCell
    {
        let item:MGandallerDetailItemPicturesItem = modelAtIndex(indexPath)
        let cell:VGandallerDetailCellPicturesCell = collectionView.dequeueReusableCellWithReuseIdentifier(
            VGandallerDetailCellPicturesCell.reusableIdentifier(),
            forIndexPath:
            indexPath) as! VGandallerDetailCellPicturesCell
        cell.config(item)
        
        return cell
    }
}
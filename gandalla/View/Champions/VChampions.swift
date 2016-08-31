import UIKit

class VChampions:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    weak var controller:CChampions!
    weak var collection:UICollectionView!
    weak var spinner:VMainLoader?
    weak var pageControl:UIPageControl!
    private let kPageControlBottom:Int = 30
    private let kMaxChampions:Int = 3
    
    convenience init(controller:CChampions)
    {
        self.init()
        self.controller = controller
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
        translatesAutoresizingMaskIntoConstraints = false
        
        let flow:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flow.headerReferenceSize = CGSizeZero
        flow.footerReferenceSize = CGSizeZero
        flow.sectionInset = UIEdgeInsetsZero
        flow.minimumLineSpacing = 0
        flow.minimumInteritemSpacing = 0
        flow.scrollDirection = UICollectionViewScrollDirection.Horizontal
        
        let collection:UICollectionView = UICollectionView(frame:CGRectZero, collectionViewLayout:flow)
        collection.backgroundColor = UIColor.clearColor()
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.clipsToBounds = true
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.alwaysBounceHorizontal = true
        collection.pagingEnabled = true
        collection.delegate = self
        collection.dataSource = self
        collection.registerClass(
            VChampionsCell.self,
            forCellWithReuseIdentifier:
            VChampionsCell.reusableIdentifier())
        collection.hidden = true
        self.collection = collection
        
        let pageControl:UIPageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.backgroundColor = UIColor.clearColor()
        pageControl.currentPageIndicatorTintColor = UIColor.complement()
        pageControl.pageIndicatorTintColor = UIColor(white:0.94, alpha:1)
        pageControl.addTarget(self, action:#selector(self.actionPageSelected(sender:)), forControlEvents:UIControlEvents.ValueChanged)
        pageControl.hidden = true
        self.pageControl = pageControl
        
        let label:UILabel = UILabel()
        label.userInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.Center
        label.backgroundColor = UIColor.clearColor()
        label.font = UIFont.bold(12)
        label.textColor = UIColor.blackColor()
        label.text = NSLocalizedString("VChampions_title", comment:"")
        
        let spinner:VMainLoader = VMainLoader()
        self.spinner = spinner
        
        addSubview(collection)
        addSubview(label)
        addSubview(pageControl)
        addSubview(spinner)
        
        let views:[String:AnyObject] = [
            "collection":collection,
            "spinner":spinner,
            "pageControl":pageControl,
            "label":label]
        
        let metrics:[String:AnyObject] = [
        "pageControlBottom":kPageControlBottom]
        
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
            "H:|-0-[label]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[label(14)]-0-[pageControl(pageControlBottom)]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[spinner]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[spinner]-0-|",
            options:[],
            metrics:metrics,
            views:views))
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
    
    private func modelAtIndex(index:NSIndexPath) -> MChampionsItem
    {
        let item:MChampionsItem = controller.model!.items[index.item]
        
        return item
    }
    
    //MARK: public
    
    func championsLoaded()
    {
        dispatch_async(dispatch_get_main_queue())
        { [weak self] in
            
            if self != nil
            {
                self!.spinner?.removeFromSuperview()
                self!.collection.reloadData()
                self!.collection.hidden = false
                self!.pageControl.currentPage = 0
                self!.pageControl.numberOfPages = self!.kMaxChampions
                self!.pageControl.hidden = false
            }
        }
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
    
    func collectionView(collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize
    {
        let size:CGSize = collectionView.bounds.size
        
        return size
    }
    
    func numberOfSectionsInCollectionView(collectionView:UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        let count:Int
        
        if controller.model == nil
        {
            count = 0
        }
        else
        {
            let realCount:Int = controller.model!.items.count
            
            if realCount > kMaxChampions
            {
                count = kMaxChampions
            }
            else
            {
                count = realCount
            }
        }
        
        return count
    }
    
    func collectionView(collectionView:UICollectionView, cellForItemAtIndexPath indexPath:NSIndexPath) -> UICollectionViewCell
    {
        let item:MChampionsItem = modelAtIndex(indexPath)
        let cell:VChampionsCell = collectionView.dequeueReusableCellWithReuseIdentifier(
            VChampionsCell.reusableIdentifier(),
            forIndexPath:
            indexPath) as! VChampionsCell
        cell.config(item)
        
        return cell
    }
    
    func collectionView(collectionView:UICollectionView, didSelectItemAtIndexPath indexPath:NSIndexPath)
    {
        controller.showGandaller(indexPath)
        
        dispatch_after(
            dispatch_time(DISPATCH_TIME_NOW,
                Int64(NSEC_PER_SEC)),
            dispatch_get_main_queue())
        { [weak collectionView] in
            
            collectionView?.selectItemAtIndexPath(nil, animated:false, scrollPosition:UICollectionViewScrollPosition.None)
        }
    }
}
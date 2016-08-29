import UIKit

class VChampions:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    weak var controller:CChampions!
    weak var collection:UICollectionView!
    weak var spinner:VMainLoader?
    private let kCollectionBottom:CGFloat = 40
    private let kCellHeight:CGFloat = 300
    private let kMaxChampions:Int = 3
    
    convenience init(controller:CChampions)
    {
        self.init()
        self.controller = controller
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
        translatesAutoresizingMaskIntoConstraints = false
        
        let collectionTop:CGFloat = controller.parent.kBarHeight
        let flow:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flow.headerReferenceSize = CGSizeZero
        flow.footerReferenceSize = CGSizeZero
        flow.sectionInset = UIEdgeInsetsMake(collectionTop, 0, kCollectionBottom, 0)
        flow.minimumLineSpacing = 0
        flow.minimumInteritemSpacing = 0
        flow.scrollDirection = UICollectionViewScrollDirection.Vertical
        
        let collection:UICollectionView = UICollectionView(frame:CGRectZero, collectionViewLayout:flow)
        collection.backgroundColor = UIColor.clearColor()
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.clipsToBounds = true
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.alwaysBounceVertical = true
        collection.delegate = self
        collection.dataSource = self
        collection.registerClass(
            VChampionsCell.self,
            forCellWithReuseIdentifier:
            VChampionsCell.reusableIdentifier())
        collection.hidden = true
        self.collection = collection
        
        let spinner:VMainLoader = VMainLoader()
        self.spinner = spinner
        
        addSubview(collection)
        addSubview(spinner)
        
        let views:[String:AnyObject] = [
            "collection":collection,
            "spinner":spinner]
        
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
            
            self?.spinner?.removeFromSuperview()
            self?.collection.reloadData()
            self?.collection.hidden = false
        }
    }
    
    //MARK: collection del
    
    func scrollViewDidScroll(scrollView:UIScrollView)
    {
        controller.parent.scrollDidScroll(scrollView)
    }
    
    func collectionView(collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize
    {
        let width:CGFloat = collectionView.bounds.maxX
        let size:CGSize = CGSizeMake(width, kCellHeight)
        
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
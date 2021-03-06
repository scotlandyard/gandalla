import UIKit

class VNews:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    weak var controller:CNews!
    weak var collection:UICollectionView!
    weak var spinner:VMainLoader?
    private let kCollectionBottom:CGFloat = 20
    private let kInterLine:CGFloat = 1
    
    convenience init(controller:CNews)
    {
        self.init()
        clipsToBounds = true
        backgroundColor = UIColor.collectionBackground()
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let collectionTop:CGFloat = controller.parent.kBarHeight
        
        let spinner:VMainLoader = VMainLoader()
        self.spinner = spinner
        
        let flow:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flow.headerReferenceSize = CGSizeZero
        flow.footerReferenceSize = CGSizeZero
        flow.sectionInset = UIEdgeInsetsMake(collectionTop, 0, kCollectionBottom, 0)
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
            VNewsCellJoined.self,
            forCellWithReuseIdentifier:
            VNewsCellJoined.reusableIdentifier())
        collection.registerClass(
            VNewsCellPicture.self,
            forCellWithReuseIdentifier:
            VNewsCellPicture.reusableIdentifier())
        collection.registerClass(
            VNewsCellPower.self,
            forCellWithReuseIdentifier:
            VNewsCellPower.reusableIdentifier())
        collection.registerClass(
            VNewsCellSocial.self,
            forCellWithReuseIdentifier:
            VNewsCellSocial.reusableIdentifier())
        collection.registerClass(
            VNewsCellVideo.self,
            forCellWithReuseIdentifier:
            VNewsCellVideo.reusableIdentifier())
        self.collection = collection
        
        addSubview(spinner)
        addSubview(collection)
        
        let views:[String:AnyObject] = [
            "spinner":spinner,
            "collection":collection]
        
        let metrics:[String:AnyObject] = [:]
        
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
    
    private func modelAtIndex(index:NSIndexPath) -> MNewsItem
    {
        let item:MNewsItem = controller.model.items[index.item]
        
        return item
    }
    
    //MARK: public
    
    func reload(items:[NSIndexPath])
    {
        spinner?.stopAnimating()
        spinner?.removeFromSuperview()
        collection.insertItemsAtIndexPaths(items)
    }
    
    //MARK: col del
    
    func scrollViewDidScroll(scrollView:UIScrollView)
    {
        controller.parent.scrollDidScroll(scrollView)
    }
    
    func collectionView(collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize
    {
        let item:MNewsItem = modelAtIndex(indexPath)
        let width:CGFloat = collectionView.bounds.maxX
        let height:CGFloat = item.fModel.cellHeight()
        let size:CGSize = CGSizeMake(width, height)
        
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
        let item:MNewsItem = modelAtIndex(indexPath)
        let reusableIdentifier:String = item.fModel.reusableIdentifier()
        let cell:VNewsCell = collectionView.dequeueReusableCellWithReuseIdentifier(
            reusableIdentifier,
            forIndexPath:
            indexPath) as! VNewsCell
        cell.config(item)
        
        return cell
    }
    
    func collectionView(collectionView:UICollectionView, didSelectItemAtIndexPath indexPath:NSIndexPath)
    {
        controller.showGandaller(indexPath)
        
        dispatch_after(
            dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_SEC)),
            dispatch_get_main_queue())
        { [weak collectionView] in
            
            collectionView?.selectItemAtIndexPath(nil, animated:true, scrollPosition:UICollectionViewScrollPosition.None)
        }
    }
}
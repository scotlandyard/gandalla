import UIKit

class VCreateDetail:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    weak var controller:CCreateDetail!
    weak var spinner:VMainLoader!
    weak var collection:UICollectionView!
    weak var layoutCollectionBottom:NSLayoutConstraint!
    private let kInterLine:CGFloat = 1
    private let kHeaderHeight:CGFloat = 80
    private let kCollectionBottom:CGFloat = 30
    
    convenience init(controller:CCreateDetail)
    {
        self.init()
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.collectionBackground()
        self.controller = controller
        
        let spinner:VMainLoader = VMainLoader()
        spinner.stopAnimating()
        self.spinner = spinner
        
        let flow:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flow.headerReferenceSize = CGSizeMake(0, kHeaderHeight)
        flow.footerReferenceSize = CGSizeZero
        flow.sectionInset = UIEdgeInsetsMake(0, 0, kCollectionBottom, 0)
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
            VCreateDetailCellText.self,
            forCellWithReuseIdentifier:
            VCreateDetailCellText.reusableIdentifier())
        collection.registerClass(
            VCreateDetailCellStatus.self,
            forCellWithReuseIdentifier:
            VCreateDetailCellStatus.reusableIdentifier())
        collection.registerClass(
            VCreateDetailCellStarted.self,
            forCellWithReuseIdentifier:
            VCreateDetailCellStarted.reusableIdentifier())
        collection.registerClass(
            VCreateDetailCellImage.self,
            forCellWithReuseIdentifier:
            VCreateDetailCellImage.reusableIdentifier())
        collection.registerClass(
            VCreateDetailCellNotify.self,
            forCellWithReuseIdentifier:
            VCreateDetailCellNotify.reusableIdentifier())
        collection.registerClass(
            VCreateDetailHeader.self,
            forSupplementaryViewOfKind:
            UICollectionElementKindSectionHeader,
            withReuseIdentifier:
            VCreateDetailHeader.reusableIdentifier())
        self.collection = collection
        
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
            "V:|-0-[collection]",
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
        
        layoutCollectionBottom = NSLayoutConstraint(
            item:collection,
            attribute:NSLayoutAttribute.Bottom,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Bottom,
            multiplier:1,
            constant:0)
        
        addConstraint(layoutCollectionBottom)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(self.notifiedKeyboardChanged(sender:)), name:UIKeyboardWillChangeFrameNotification, object:nil)
    }
    
    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func layoutSubviews()
    {
        dispatch_async(dispatch_get_main_queue())
        { [weak self] in
            
            self?.collection.collectionViewLayout.invalidateLayout()
        }
        
        super.layoutSubviews()
    }
    
    //MARK: notified
    
    func notifiedKeyboardChanged(sender notification:NSNotification)
    {
        let keyRect:CGRect = notification.userInfo![UIKeyboardFrameEndUserInfoKey]!.CGRectValue()
        let yOrigin = keyRect.origin.y
        let screenHeight:CGFloat = UIScreen.mainScreen().bounds.size.height
        
        if yOrigin < screenHeight
        {
            layoutCollectionBottom.constant = -(screenHeight - yOrigin)
        }
        else
        {
            layoutCollectionBottom.constant = 0
        }
    }
    
    //MARK: private
    
    private func sectionAtIndex(index:NSIndexPath) -> MCreateItemDetailProperty
    {
        let section:MCreateItemDetailProperty = controller.model.properties[index.section]
        
        return section
    }
    
    private func modelAtIndex(index:NSIndexPath) -> MCreateItemDetailPropertyItem
    {
        let section:MCreateItemDetailProperty = sectionAtIndex(index)
        let item:MCreateItemDetailPropertyItem = section.items[index.item]
        
        return item
    }
    
    //MARK: public
    
    func showLoading()
    {
        dispatch_async(dispatch_get_main_queue())
        { [weak self] in
            
            self?.spinner.startAnimating()
            self?.collection.hidden = true
        }
    }
    
    func hideLoading()
    {
        dispatch_async(dispatch_get_main_queue())
        { [weak self] in
            
            self?.spinner.stopAnimating()
            self?.collection.reloadData()
            self?.collection.hidden = false
        }
    }
    
    //MARK: col del
    
    func scrollViewDidScroll(scrollView:UIScrollView)
    {
        controller.parent.scrollDidScroll(scrollView)
    }
    
    func collectionView(collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize
    {
        let section:MCreateItemDetailProperty = sectionAtIndex(indexPath)
        let width:CGFloat = collectionView.bounds.maxX
        let size:CGSize = CGSizeMake(width, section.cellHeight)
        
        return size
    }
    
    func numberOfSectionsInCollectionView(collectionView:UICollectionView) -> Int
    {
        let count:Int = controller.model.properties.count
        
        return count
    }
    
    func collectionView(collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        let count:Int = controller.model.properties[section].items.count
        
        return count
    }
    
    func collectionView(collectionView:UICollectionView, viewForSupplementaryElementOfKind kind:String, atIndexPath indexPath:NSIndexPath) -> UICollectionReusableView
    {
        let section:MCreateItemDetailProperty = sectionAtIndex(indexPath)
        let header:VCreateDetailHeader = collectionView.dequeueReusableSupplementaryViewOfKind(
            kind,
            withReuseIdentifier:
            VCreateDetailHeader.reusableIdentifier(),
            forIndexPath:indexPath) as! VCreateDetailHeader
        
        header.config(controller, model:section)
        
        return header
    }
    
    func collectionView(collectionView:UICollectionView, cellForItemAtIndexPath indexPath:NSIndexPath) -> UICollectionViewCell
    {
        let section:MCreateItemDetailProperty = sectionAtIndex(indexPath)
        let item:MCreateItemDetailPropertyItem = modelAtIndex(indexPath)
        let cell:VCreateDetailCell = collectionView.dequeueReusableCellWithReuseIdentifier(
            section.reusableIdentifier,
            forIndexPath:
            indexPath) as! VCreateDetailCell
        item.config(controller, cell:cell)
        
        return cell
    }
    
    func collectionView(collectionView:UICollectionView, shouldDeselectItemAtIndexPath indexPath:NSIndexPath) -> Bool
    {
        return false
    }
    
    func collectionView(collectionView:UICollectionView, shouldSelectItemAtIndexPath indexPath:NSIndexPath) -> Bool
    {
        return false
    }
}
import UIKit

class CCreateDetail:CMainController
{
    let model:MCreateItemDetail
    weak var viewDetail:VCreateDetail!
    
    init(model:MCreateItemDetail)
    {
        self.model = model
        
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func loadView()
    {
        let viewDetail:VCreateDetail = VCreateDetail(controller:self)
        self.viewDetail = viewDetail
        view = viewDetail
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        model.generate()
    }
    
    //MARK: notified
    
    func notifiedGandallerUpdated(sender notification:NSNotification)
    {
        NSNotificationCenter.defaultCenter().removeObserver(self)
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            self?.model.generate()
            let topCollection:CGRect = CGRectMake(0, 0, 1, 1)
            
            dispatch_async(dispatch_get_main_queue())
            { [weak self] in
                
                self?.viewDetail.hideLoading()
                self?.viewDetail.collection.scrollRectToVisible(topCollection, animated:true)
            }
        }
    }
    
    //MARK: public
    
    func addImage()
    {
        viewDetail.showLoading()
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(self.notifiedGandallerUpdated(sender:)), name:NSNotification.NSNotificationName.GandallersLoaded.rawValue, object:nil)
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            if self != nil
            {
                let parentReference:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.Gandaller
                let childId:String = self!.model.gandaller.gandallerId
                let property:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.Images.rawValue
                let fImage:FDatabaseModelGandallerImage = FDatabaseModelGandallerImageWaiting()
                let imageJson:[String:AnyObject] = fImage.modelJson()
                
                FMain.sharedInstance.database.createSubChild(
                    parentReference,
                    childId:childId,
                    property:property,
                    json:imageJson)
            }
        }
    }
    
    func removeImage(model:MCreateItemDetailPropertyItemImage)
    {
        viewDetail.showLoading()
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(self.notifiedGandallerUpdated(sender:)), name:NSNotification.NSNotificationName.GandallersLoaded.rawValue, object:nil)
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            if self != nil
            {
                if model.fImage != nil
                {
                    let parentReference:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.Gandaller
                    let childId:String = self!.model.gandaller.gandallerId
                    let imageId:String = model.fImage!.imageId!
                    let imageNotification:String? = model.fImage?.imageNotification
                    let property:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.Images.rawValue
                    
                    if model.fImage!.status == FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus.Ready
                    {
                        let parentStorageRereference:FStorage.FStorageReference = FStorage.FStorageReference.Gandaller
                        
                        FMain.sharedInstance.storage.deleteData(
                            parentStorageRereference,
                            parentId:childId,
                            childId:imageId,
                            completionHandler:nil)
                    }
                    
                    FMain.sharedInstance.database.deleteSubChild(
                        parentReference,
                        childId:childId,
                        property:property,
                        subChildId:imageId)
                    
                    if imageNotification != nil
                    {
                        let newsReference:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.News
                        
                        FMain.sharedInstance.database.deleteChild(
                            newsReference,
                            childId:imageNotification!)
                    }
                }
            }
        }
    }
    
    func makeProfilePicture(imageId:String)
    {
        viewDetail.showLoading()
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(self.notifiedGandallerUpdated(sender:)), name:NSNotification.NSNotificationName.GandallersLoaded.rawValue, object:nil)
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            if self != nil
            {
                let gandallerId:String = self!.model.gandaller.gandallerId
                let reference:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.Gandaller
                let propertyId:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.ProfileImage.rawValue
                
                FMain.sharedInstance.database.updateProperty(
                    reference,
                    childId:gandallerId,
                    property:propertyId,
                    value:imageId)
            }
        }
    }
}
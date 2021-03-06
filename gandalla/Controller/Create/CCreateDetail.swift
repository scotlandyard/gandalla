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
            
            self?.updateModel()
        }
    }
    
    //MARK: private
    
    private func updateModel()
    {
        model.generate()
        let topCollection:CGRect = CGRectMake(0, 0, 1, 1)
        
        dispatch_async(dispatch_get_main_queue())
        { [weak self] in
            
            self?.viewDetail.hideLoading()
            self?.viewDetail.collection.scrollRectToVisible(topCollection, animated:true)
        }
    }
    
    private func startLoading()
    {
        viewDetail.showLoading()
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector:#selector(self.notifiedGandallerUpdated(sender:)),
            name:NSNotification.NSNotificationName.GandallersLoaded.rawValue,
            object:nil)
    }
    
    //MARK: public
    
    func addImage()
    {
        startLoading()
        
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
    
    func addPower()
    {
        startLoading()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            if self != nil
            {
                let parentReference:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.Gandaller
                let childId:String = self!.model.gandaller.gandallerId
                let property:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.Powers.rawValue
                let fPower:FDatabaseModelGandallerPower = FDatabaseModelGandallerPower()
                let powerJson:[String:AnyObject] = fPower.modelJson()
                
                FMain.sharedInstance.database.createSubChild(
                    parentReference,
                    childId:childId,
                    property:property,
                    json:powerJson)
            }
        }
    }
    
    func addHashtag()
    {
        startLoading()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            if self != nil
            {
                let parentReference:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.Gandaller
                let childId:String = self!.model.gandaller.gandallerId
                let subChild:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.Social.rawValue
                let subProperty:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.SocialHashtags.rawValue
                let property:String = "\(subChild)/\(subProperty)"
                let fHashtag:FDatabaseModelGandallerSocialHashtag = FDatabaseModelGandallerSocialHashtag()
                let hashtagJson:[String:AnyObject] = fHashtag.modelJson()
                
                FMain.sharedInstance.database.createSubChild(
                    parentReference,
                    childId:childId,
                    property:property,
                    json:hashtagJson)
            }
        }
    }
    
    func addVideo()
    {
        startLoading()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            if self != nil
            {
                let parentReference:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.Gandaller
                let childId:String = self!.model.gandaller.gandallerId
                let property:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.Videos.rawValue
                let fVideo:FDatabaseModelGandallerVideo = FDatabaseModelGandallerVideo()
                let videoJson:[String:AnyObject] = fVideo.modelJson()
                
                FMain.sharedInstance.database.createSubChild(
                    parentReference,
                    childId:childId,
                    property:property,
                    json:videoJson)
            }
        }
    }
    
    func removeImage(fImage:FDatabaseModelGandallerImage)
    {
        startLoading()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            if self != nil
            {
                let parentReference:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.Gandaller
                let childId:String = self!.model.gandaller.gandallerId
                let imageId:String = fImage.imageId
                let imageNotification:String? = fImage.imageNotification
                let property:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.Images.rawValue
                
                if fImage.status == FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus.Ready
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
    
    func makeProfilePicture(imageId:String)
    {
        startLoading()
        
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
    
    func changeImageStatus(fImage:FDatabaseModelGandallerImage)
    {
        if fImage.status == FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus.Waiting
        {
            startLoading()
            
            let gandallerId:String = model.gandaller.gandallerId
            let imageId:String = fImage.imageId
            let reference:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.Gandaller
            let propertyId:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.Images.rawValue
            let subPropertyId:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.ImageStatus.rawValue
            let newStatus:Int = FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus.Ready.rawValue
            let propertyImageNotification:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.ImageNotification.rawValue
            
            FMain.sharedInstance.database.updateSubProperty(
                reference,
                childId:gandallerId,
                property:propertyId,
                subChildId:imageId,
                subPropertyId:subPropertyId,
                value:newStatus)
            
            let news:FDatabaseModelNews = FDatabaseModelNewsPicture(gandallerId:gandallerId, pictureId:imageId)
            let newsJson:[String:AnyObject] = news.modelJson()
            let newsId:String = FMain.sharedInstance.database.createChild(
                FDatabase.FDatabaseReference.News,
                json:newsJson)
            
            FMain.sharedInstance.database.updateSubProperty(
                reference,
                childId:gandallerId,
                property:propertyId,
                subChildId:imageId,
                subPropertyId:propertyImageNotification,
                value:newsId)
        }
        else
        {
            updateModel()
        }
    }
    
    func removePower(fPower:FDatabaseModelGandallerPower)
    {
        startLoading()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            if self != nil
            {
                let notificationId:String? = fPower.powerNotification
                
                if notificationId != nil
                {
                    let newsReference:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.News
                    
                    FMain.sharedInstance.database.deleteChild(
                        newsReference,
                        childId:notificationId!)
                }
                
                let parentReference:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.Gandaller
                let childId:String = self!.model.gandaller.gandallerId
                let powerId:String = fPower.powerId
                let property:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.Powers.rawValue
                
                FMain.sharedInstance.database.deleteSubChild(
                    parentReference,
                    childId:childId,
                    property:property,
                    subChildId:powerId)
            }
        }
    }
    
    func removeHashtag(fHashtag:FDatabaseModelGandallerSocialHashtag)
    {
        startLoading()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            if self != nil
            {
                let parentReference:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.Gandaller
                let childId:String = self!.model.gandaller.gandallerId
                let hashtagId:String = fHashtag.hashtagId
                let subChild:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.Social.rawValue
                let subProperty:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.SocialHashtags.rawValue
                let property:String = "\(subChild)/\(subProperty)"
                
                FMain.sharedInstance.database.deleteSubChild(
                    parentReference,
                    childId:childId,
                    property:property,
                    subChildId:hashtagId)
            }
        }
    }
    
    func removeVideo(fVideo:FDatabaseModelGandallerVideo)
    {
        startLoading()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            if self != nil
            {
                let notificationId:String? = fVideo.videoNotification
                
                if notificationId != nil
                {
                    let newsReference:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.News
                    
                    FMain.sharedInstance.database.deleteChild(
                        newsReference,
                        childId:notificationId!)
                }
                
                let parentReference:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.Gandaller
                let childId:String = self!.model.gandaller.gandallerId
                let videoId:String = fVideo.videoId
                let property:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.Videos.rawValue
                
                FMain.sharedInstance.database.deleteSubChild(
                    parentReference,
                    childId:childId,
                    property:property,
                    subChildId:videoId)
            }
        }
    }
}
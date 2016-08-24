import UIKit

class CCreateDetail:CMainController
{
    let model:MCreateItemDetail
    weak var viewDetail:VCreateDetail!
    
    init(model:MCreateItemDetail)
    {
        self.model = model
        model.generate()
        
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
    
    //MARK: notified
    
    func notifiedGandallerUpdated(sender notification:NSNotification)
    {
        NSNotificationCenter.defaultCenter().removeObserver(self)
        viewDetail.hideLoading()
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
                let childId:String = self!.model.gandallerId
                let property:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.Images.rawValue
                let fImage:FDatabaseModelGandallerImage = FDatabaseModelGandallerImageWaiting()
                let imageJson:[String:AnyObject] = fImage.modelJson()
                
                FMain.sharedInstance.database.createSubChild(
                    parentReference,
                    childId:childId,
                    property:property,
                    value:imageJson)
            }
        }
    }
    
    func removeImage(model:MCreateItemDetailPropertyItemImage)
    {
        
    }
}
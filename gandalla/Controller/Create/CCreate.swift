import UIKit

class CCreate:CMainController
{
    weak var viewCreate:VCreate!
    let model:MCreate
    var listenHandler:UInt?
    
    init()
    {
        model = MCreate()
        
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
        let viewCreate:VCreate = VCreate(controller:self)
        self.viewCreate = viewCreate
        view = viewCreate
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(self.notifiedGandallers(sender:)), name:NSNotification.NSNotificationName.GandallersLoaded.rawValue, object:nil)
    }
    
    //MARK: notified
    
    func notifiedGandallers(sender notification:NSNotification)
    {
        model.update()
        viewCreate.reload()
    }
    
    //MARK: public
    
    func createGandaller()
    {
        viewCreate.showLoading()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        {
            let fGandaller:FDatabaseModelGandaller = FDatabaseModelGandallerPaused()
            let json:[String:AnyObject] = fGandaller.modelJson()
            let gandallerId:String = FMain.sharedInstance.database.createChild(FDatabase.FDatabaseReference.Gandaller, json:json)
            
            
            let message:String = NSLocalizedString("CCreate_gandallerCreated", comment:"")
            VMainAlert.Message(message)
        }
    }
}
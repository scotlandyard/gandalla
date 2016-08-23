import UIKit

class CNews:CMainController
{
    weak var viewNews:VNews!
    let model:MNews
    var listenHandler:UInt?
    
    init()
    {
        model = MNews()
        
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    deinit
    {
        if listenHandler != nil
        {
            FMain.sharedInstance.database.stopListeningParent(FDatabase.FDatabaseReference.News, handler:listenHandler!)
        }
    }/*
    
    override func loadView()
    {
        let viewCreate:VCreate = VCreate(controller:self)
        self.viewCreate = viewCreate
        view = viewCreate
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        listenHandler = FMain.sharedInstance.database.listenGandaller()
            { [weak self] (snapshot) in
                
                let json:[String:[String:AnyObject]]? = snapshot.value as? [String:[String:AnyObject]]
                
                if json == nil
                {
                    self?.model.clear()
                    self?.updateFinished()
                }
                else
                {
                    self?.gandallerUpdated(json!)
                }
        }
    }
    
    //MARK: private
    
    private func gandallerUpdated(json:[String:[String:AnyObject]])
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            self?.model.update(json)
            self?.updateFinished()
        }
    }
    
    private func updateFinished()
    {
        dispatch_async(dispatch_get_main_queue())
        { [weak self] in
            
            self?.viewCreate.reload()
        }
    }
    
    //MARK: public
    
    func createGandaller()
    {
        viewCreate.showLoading()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        {
            FMain.sharedInstance.database.createGandaller()
        }
    }*/
}
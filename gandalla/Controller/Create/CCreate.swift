import UIKit

class CCreate:CMainController
{
    weak var viewCreate:VCreate!
    let model:MCreate
    
    init()
    {
        model = MCreate()
        
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
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
        
        FMain.sharedInstance.database.listenGandaller()
        { [weak self] (snapshot) in
            
            let json:[String:AnyObject]? = snapshot.value as? [String:AnyObject]
            
            if json == nil
            {
                self?.updateFinished()
            }
            else
            {
                self?.gandallerUpdated(json!)
            }
        }
    }
    
    //MARK: private
    
    private func gandallerUpdated(json:[String:AnyObject])
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
    }
}
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
        NSNotificationCenter.defaultCenter().removeObserver(self)
        
        if listenHandler != nil
        {
            FMain.sharedInstance.database.stopListeningParent(FDatabase.FDatabaseReference.News, handler:listenHandler!)
        }
    }
    
    override func loadView()
    {
        let viewNews:VNews = VNews(controller:self)
        self.viewNews = viewNews
        view = viewNews
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if MGandaller.sharedInstance.items.isEmpty
        {
            print("empty list gandallers!!!!!!!!!!!!!!!")
            
            NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(self.notifiedGandallersUpdated(sender:)), name:NSNotification.NSNotificationName.GandallersLoaded.rawValue, object:nil)
        }
        else
        {
            fetchNews()
        }
    }
    
    //MARK: notified
    
    func notifiedGandallersUpdated(sender notification:NSNotification)
    {
        fetchNews()
    }
    
    //MARK: private
    
    private func fetchNews()
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            if self != nil
            {
                self!.listenHandler = FMain.sharedInstance.database.listenParent(FDatabase.FDatabaseReference.News)
                { [weak self] (snapshot) in
                    
                    let json:[String:[String:AnyObject]]? = snapshot.value as? [String:[String:AnyObject]]
                    
                    if json != nil
                    {
                        self?.newsReceived(json!)
                    }
                }
            }
        }
    }
    
    private func newsReceived(json:[String:[String:AnyObject]])
    {
        let updates:NSMutableSet = NSMutableSet()
        let keys:[String] = Array(json.keys)
        
        for key:String in keys
        {
            let inJson:[String:AnyObject] = json[key]!
            let fNews:FDatabaseModelNews = FDatabaseModelNews.withJson(inJson)
            let indexPath:NSIndexPath? = model.addNews(key, fModel:fNews)
            
            if indexPath != nil
            {
                updates.addObject(indexPath!)
            }
        }
        
        
    }
}
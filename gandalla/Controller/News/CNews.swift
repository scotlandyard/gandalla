import UIKit

class CNews:CMainController
{
    weak var viewNews:VNews!
    let model:MNews
    var listenHandler:UInt?
    var lastTimestamp:NSTimeInterval
    
    init()
    {
        model = MNews()
        lastTimestamp = 0
        
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
        NSNotificationCenter.defaultCenter().removeObserver(self)
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
        var updates:[NSIndexPath] = []
        var maxTimestamp:NSTimeInterval = lastTimestamp
        let keys:[String] = Array(json.keys)
        
        for key:String in keys
        {
            let inJson:[String:AnyObject] = json[key]!
            let fNews:FDatabaseModelNews = FDatabaseModelNews.withJson(inJson)
            let created:NSTimeInterval = fNews.created
            
            if created > lastTimestamp
            {
                let indexPath:NSIndexPath? = model.addNews(key, fModel:fNews)
                
                if indexPath != nil
                {
                    updates.append(indexPath!)
                }
                
                if created > maxTimestamp
                {
                    maxTimestamp = created
                }
            }
        }
        
        lastTimestamp = maxTimestamp
        
        if !updates.isEmpty
        {
            dispatch_async(dispatch_get_main_queue())
            { [weak self] in
                
                self?.updatesReady(updates)
            }
        }
    }
    
    private func updatesReady(updates:[NSIndexPath])
    {
        viewNews.reload(updates)
    }
    
    //MARK: public
    
    func showGandaller(index:NSIndexPath)
    {
        let liked:MNewsItem = model.items[index.item]
        let item:MGandallerItem = liked.gandaller
        let gandallerName:String = item.fModel.name
        let controller:CGandallerDetail = CGandallerDetail(gandaller:item)
        let transition:MMainTransition = MMainTransition.Push(gandallerName)
        parent.pushController(controller, transition:transition)
    }
}
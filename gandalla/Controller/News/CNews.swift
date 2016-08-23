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
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(self.notifiedGandallersUpdated(sender:)), name:NSNotification.NSNotificationName.GandallersLoaded.rawValue, object:nil)
        
        listenHandler = FMain.sharedInstance.database.listenParent(FDatabase.FDatabaseReference.News)
        { [weak self] (snapshot) in
            
            let json:[String:[String:AnyObject]]? = snapshot.value as? [String:[String:AnyObject]]
            
            if json != nil
            {
                self?.newsReceived(json!)
            }
        }
    }
    
    //MARK: notified
    
    func notifiedGandallersUpdated(sender notification:NSNotification)
    {
        
    }
    
    //MARK: private
    
    private func newsReceived(json:[String:[String:AnyObject]])
    {
        let keys:[String] = Array(json.keys)
        
        for key:String in keys
        {
            let inJson:[String:AnyObject] = json[key]!
            let fNews:FDatabaseModelNews = FDatabaseModelNews
            let fGandaller:FDatabaseModelGandaller = FDatabaseModelGandaller.withJson(inJson)
            var inGandaller:MGandallerItem?
            
            for gandaller:MGandallerItem in newItems
            {
                if gandaller.gandallerId == key
                {
                    inGandaller = gandaller
                    
                    break
                }
            }
            
            if inGandaller == nil
            {
                let newGandaller:MGandallerItem = MGandallerItem(gandallerId:key, fModel:fGandaller)
                newItems.append(newGandaller)
            }
            else
            {
                inGandaller!.fModel = fGandaller
            }
        }
    }
}
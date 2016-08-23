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
        
        listenHandler = FMain.sharedInstance.database.listenParent(FDatabase.FDatabaseReference.News)
        { [weak self] (snapshot) in
            
            let json:[String:[String:AnyObject]]? = snapshot.value as? [String:[String:AnyObject]]
            
            if json != nil
            {
                self?.newsReceived(json!)
            }
        }
    }
    
    //MARK: private
    
    private func newsReceived(json:[String:[String:AnyObject]])
    {
        
    }
}
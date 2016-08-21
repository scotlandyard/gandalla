import UIKit

class CNews:CMainController
{
    weak var viewNews:VNews!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        MUser.sharedInstance.load()
    }
    
    override func loadView()
    {
        let viewNews:VNews = VNews(controller:self)
        self.viewNews = viewNews
        view = viewNews
    }
}
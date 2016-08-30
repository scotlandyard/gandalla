import UIKit

class CNotifications:CMainController
{
    weak var viewNotifications:VNotifications!
    let model:MNotifications
    
    init()
    {
        model = MNotifications()
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func loadView()
    {
        let viewNotifications:VNotifications = VNotifications(controller:self)
        self.viewNotifications = viewNotifications
        view = viewNotifications
    }
    
    //MARK: public
    
    func selectedNotification(index:NSIndexPath)
    {
        
    }
}
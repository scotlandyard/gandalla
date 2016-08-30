import UIKit

class MMainNavItemNotifications:MMainNavItem
{
    private let kImage:String = "navigationNotifications"
    
    init(index:Int)
    {
        super.init(image:kImage, index:index)
    }
    
    override func controller() -> UIViewController
    {
        let create:CNotifications = CNotifications()
        
        return create
    }
}
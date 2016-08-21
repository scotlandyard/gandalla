import UIKit

class MMainNavItemNews:MMainNavItem
{
    private let kImage:String = "navigationCreate"
    
    init(index:Int)
    {
        super.init(image:kImage, index:index)
    }
    
    override func controller() -> UIViewController
    {
        let news:CNews = CNews()
        
        return news
    }
}
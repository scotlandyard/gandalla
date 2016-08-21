import UIKit

class MMainNavItemNews:MMainNavItem
{
    private let kImage:String = "navigationNews"
    
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
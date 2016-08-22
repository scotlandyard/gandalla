import UIKit

class MMainNavItemLiked:MMainNavItem
{
    private let kImage:String = "navigationLiked"
    
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
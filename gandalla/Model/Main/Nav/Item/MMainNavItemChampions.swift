import UIKit

class MMainNavItemChampions:MMainNavItem
{
    private let kImage:String = "navigationChampions"
    
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
import UIKit

class MMainNavItemGandallers:MMainNavItem
{
    private let kImage:String = "navigationGandallers"
    
    init(index:Int)
    {
        super.init(image:kImage, index:index)
    }
    
    override func controller() -> UIViewController
    {
        let news:CGandallers = CGandallers()
        
        return news
    }
}
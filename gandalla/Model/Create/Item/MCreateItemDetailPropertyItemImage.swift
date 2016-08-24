import UIKit

class MCreateItemDetailPropertyItemImage:MCreateItemDetailPropertyItem
{
    var image:UIImage?
    
    init(image:UIImage?)
    {
        self.image = image
    }
    
    override func config(controller:CCreateDetail, cell:VCreateDetailCell)
    {
        super.config(controller, cell:cell)
        
    }
}
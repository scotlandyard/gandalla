import UIKit

class MCreateItemDetailPropertyItemImage:MCreateItemDetailPropertyItem, UIImagePickerControllerDelegate
{
    var image:UIImage?
    
    init(image:UIImage?)
    {
        self.image = image
    }
    
    override func config(controller:CCreateDetail, cell:VCreateDetailCell)
    {
        super.config(controller, cell:cell)
        let cellImage:VCreateDetailCellImage = cell as! VCreateDetailCellImage
        
    }
    
    //MARK: actions
    
    func actionEditImage(sender button:UIButton)
    {
    }
}
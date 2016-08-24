import UIKit

class MCreateItemDetailPropertyItemImage:MCreateItemDetailPropertyItem, UIImagePickerControllerDelegate
{
    var image:UIImage?
    weak var cellImage:VCreateDetailCellImage!
    
    init(image:UIImage?)
    {
        self.image = image
    }
    
    override func config(controller:CCreateDetail, cell:VCreateDetailCell)
    {
        super.config(controller, cell:cell)
        cellImage = cell as! VCreateDetailCellImage
        cellImage.buttonImage.addTarget(self, action:#selector(self.actionEditImage(sender:)), forControlEvents:UIControlEvents.TouchUpInside)
    }
    
    //MARK: actions
    
    func actionEditImage(sender button:UIButton)
    {
        controller.presentViewController(cellImage.picker, animated:true, completion:nil)
    }
    
    //MARK: image picker
    
    func imagePickerController(picker:UIImagePickerController, didFinishPickingMediaWithInfo info:[String:AnyObject])
    {
        image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        controller.dismissViewControllerAnimated(true)
        { [weak self] in
            
            self?.cellImage.image.image = self?.image
        }
    }
}
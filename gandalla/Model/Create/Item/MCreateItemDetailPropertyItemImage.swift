import UIKit

class MCreateItemDetailPropertyItemImage:MCreateItemDetailPropertyItem, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    weak var fImage:FDatabaseModelGandallerImage?
    weak var cellImage:VCreateDetailCellImage!
    var image:UIImage?
    
    init(fImage:FDatabaseModelGandallerImage)
    {
        self.fImage = fImage
    }
    
    override func config(controller:CCreateDetail, cell:VCreateDetailCell)
    {
        super.config(controller, cell:cell)
        cellImage = cell as! VCreateDetailCellImage
        cellImage.buttonImage.addTarget(self, action:#selector(self.actionEditImage(sender:)), forControlEvents:UIControlEvents.TouchUpInside)
        cellImage.picker.delegate = self
    }
    
    //MARK: actions
    
    func actionEditImage(sender button:UIButton)
    {
        controller.presentViewController(cellImage.picker, animated:true, completion:nil)
    }
    
    //MARK: private
    
    private func updaloadImage()
    {
        let imageId:String? = fImage?.imageId
        
        if image != nil && imageId != nil
        {
            let data:NSData = UIImageJPEGRepresentation(image!, 1)!
            let gandallerReference:FStorage.FStorageReference = FStorage.FStorageReference.Gandaller
            let gandallerId:String = controller.model.gandallerId
            FMain.sharedInstance.storage.saveData(
                gandallerReference,
                parentId:gandallerId,
                childId:imageId!,
                data:data)
            { [weak self] (error) in
                
                self?.cellImage.hideLoading()
            }
        }
        else
        {
            cellImage.hideLoading()
        }
    }
    
    //MARK: image picker
    
    func imagePickerController(picker:UIImagePickerController, didFinishPickingMediaWithInfo info:[String:AnyObject])
    {
        image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        controller.dismissViewControllerAnimated(true)
        { [weak self] in
            
            self?.cellImage.image.image = self?.image
            self?.cellImage.showLoading()
            self?.updaloadImage()
        }
    }
}
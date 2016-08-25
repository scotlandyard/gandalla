import UIKit

class MCreateItemDetailPropertyItemImage:MCreateItemDetailPropertyItem, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    weak var fImage:FDatabaseModelGandallerImage?
    weak var cellImage:VCreateDetailCellImage!
    var image:UIImage?
    
    init(fImage:FDatabaseModelGandallerImage?)
    {
        self.fImage = fImage
        
        here
    }
    
    override func config(controller:CCreateDetail, cell:VCreateDetailCell)
    {
        super.config(controller, cell:cell)
        cellImage = cell as! VCreateDetailCellImage
        cellImage.image.image = image
        cellImage.buttonImage.addTarget(self, action:#selector(self.actionEditImage(sender:)), forControlEvents:UIControlEvents.TouchUpInside)
        cellImage.buttonAdd.addTarget(self, action:#selector(self.actionAddImage(sender:)), forControlEvents:UIControlEvents.TouchUpInside)
        cellImage.buttonRemove.addTarget(self, action:#selector(self.actionRemoveImage(sender:)), forControlEvents:UIControlEvents.TouchUpInside)
        cellImage.picker.delegate = self
    }
    
    //MARK: actions
    
    func actionEditImage(sender button:UIButton)
    {
        controller.presentViewController(cellImage.picker, animated:true, completion:nil)
    }
    
    func actionAddImage(sender button:UIButton)
    {
        controller.addImage()
    }
    
    func actionRemoveImage(sender button:UIButton)
    {
        let alert:UIAlertController = UIAlertController(
            title:
            NSLocalizedString("MCreateItemDetailPropertyItemImage_deleteTitle", comment:""),
            message:
            NSLocalizedString("MCreateItemDetailPropertyItemImage_deleteMessage", comment:""),
            preferredStyle:UIAlertControllerStyle.ActionSheet)
        
        let actionDelete:UIAlertAction = UIAlertAction(
            title:NSLocalizedString("MCreateItemDetailPropertyItemImage_deleteDelete", comment:""),
            style:
            UIAlertActionStyle.Default)
        { [weak self] (action) in
            
            if self != nil
            {
                self!.controller.removeImage(self!)
            }
        }
        
        let actionCancel:UIAlertAction = UIAlertAction(
            title:NSLocalizedString("MCreateItemDetailPropertyItemImage_deleteCancel", comment:""),
            style:UIAlertActionStyle.Cancel,
            handler:nil)
            
        alert.addAction(actionDelete)
        alert.addAction(actionCancel)
        controller.presentViewController(alert, animated:true, completion:nil)
    }
    
    //MARK: private
    
    private func updaloadImage()
    {
        let imageId:String? = fImage?.imageId
        
        if image != nil && imageId != nil
        {
            let data:NSData = UIImageJPEGRepresentation(image!, 1)!
            let gandallerReference:FStorage.FStorageReference = FStorage.FStorageReference.Gandaller
            let gandallerId:String = controller.model.gandaller.gandallerId
            FMain.sharedInstance.storage.saveData(
                gandallerReference,
                parentId:gandallerId,
                childId:imageId!,
                data:data)
            { [weak self] (error) in
                
                if error == nil
                {
                    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
                    { [weak self] in
                        
                        self?.changeImageStatus()
                    }
                }
                
                self?.cellImage.hideLoading()
            }
        }
        else
        {
            cellImage.hideLoading()
        }
    }
    
    private func changeImageStatus()
    {
        if fImage != nil
        {
            if fImage!.status == FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus.Waiting
            {
                let reference:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.Gandaller
                let gandallerId:String = controller.model.gandaller.gandallerId
                let propertyId:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.Images.rawValue
                let imageId:String = fImage!.imageId!
                let subPropertyId:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.ImageStatus.rawValue
                let newStatus:Int = FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus.Ready.rawValue
                
                FMain.sharedInstance.database.updateSubProperty(
                    reference,
                    childId:gandallerId,
                    property:propertyId,
                    subChildId:imageId,
                    subPropertyId:subPropertyId,
                    value:newStatus)
            }
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
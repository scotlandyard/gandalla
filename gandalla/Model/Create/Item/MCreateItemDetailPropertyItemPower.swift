
import UIKit

class MCreateItemDetailPropertyItemPower:MCreateItemDetailPropertyItem, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    weak var fImage:FDatabaseModelGandallerImage?
    weak var cellImage:VCreateDetailCellImage?
    var image:UIImage?
    let profileImage:Bool
    
    init(gandallerId:String, fImage:FDatabaseModelGandallerImage, profileImage:Bool)
    {
        self.fImage = fImage
        self.profileImage = profileImage
        
        super.init()
        
        if fImage.status == FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus.Ready
        {
            let imageId:String = fImage.imageId!
            
            FMain.sharedInstance.storage.loadData(
                FStorage.FStorageReference.Gandaller,
                parentId:gandallerId,
                childId:imageId)
            { [weak self] (data) in
                
                self?.downloadedImage(data)
            }
        }
    }
    
    override func config(controller:CCreateDetail, cell:VCreateDetailCell)
    {
        super.config(controller, cell:cell)
        cellImage = cell as? VCreateDetailCellImage
        cellImage!.spinner.stopAnimating()
        cellImage!.model = self
        cellImage!.picker.delegate = self
        cellImage!.buttonImage.hidden = false
        
        if fImage?.status == FDatabaseModelGandallerImage.FDatabaseModelGandallerImageStatus.Ready
        {
            cellImage!.image.hidden = false
            cellImage!.check.hidden = false
            cellImage!.image.image = image
            
            if profileImage
            {
                cellImage!.check.setOn(true, animated:false)
                cellImage!.check.userInteractionEnabled = false
                cellImage!.buttonRemove.hidden = true
            }
            else
            {
                cellImage!.check.setOn(false, animated:false)
                cellImage!.check.userInteractionEnabled = true
                cellImage!.buttonRemove.hidden = false
            }
        }
        else
        {
            cellImage!.image.hidden = true
            cellImage!.check.hidden = true
        }
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
                    dispatch_async(dispatch_get_main_queue())
                    { [weak self] in
                        
                        if self != nil
                        {
                            if self!.fImage != nil
                            {
                                self!.controller.changeImageStatus(self!.fImage!)
                            }
                        }
                    }
                }
                else
                {
                    self?.cellImage?.hideLoading()
                }
            }
        }
        else
        {
            cellImage?.hideLoading()
        }
    }
    
    private func downloadedImage(data:NSData?)
    {
        if data != nil
        {
            let image:UIImage = UIImage(data:data!)!
            self.image = image
            
            dispatch_async(dispatch_get_main_queue())
            { [weak self] in
                
                self?.cellImage?.image.image = image
            }
        }
    }
    
    //MARK: public
    
    func editImage()
    {
        if fImage?.imageId == nil
        {
            controller.addImage()
        }
        else
        {
            if !cellImage!.picker.isBeingPresented()
            {
                controller.presentViewController(cellImage!.picker, animated:true, completion:nil)
            }
        }
    }
    
    func removeImage()
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
    
    func makeProfileImage()
    {
        controller.makeProfilePicture(fImage!.imageId!)
    }
    
    //MARK: image picker
    
    func imagePickerController(picker:UIImagePickerController, didFinishPickingMediaWithInfo info:[String:AnyObject])
    {
        image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        controller.dismissViewControllerAnimated(true)
        { [weak self] in
            
            self?.cellImage?.image.image = self?.image
            self?.cellImage?.showLoading()
            self?.updaloadImage()
        }
    }
}
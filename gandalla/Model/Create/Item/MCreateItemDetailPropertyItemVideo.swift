import UIKit

class MCreateItemDetailPropertyItemVideo:MCreateItemDetailPropertyItem, UITextFieldDelegate
{
    let gandallerId:String
    var fVideo:FDatabaseModelGandallerVideo?
    let placeholder:String
    
    init(gandallerId:String, fVideo:FDatabaseModelGandallerVideo)
    {
        self.gandallerId = gandallerId
        self.fVideo = fVideo
        placeholder = ""
        super.init()
    }
    
    override func config(controller:CCreateDetail, cell:VCreateDetailCell)
    {
        super.config(controller, cell:cell)
        
        let cellText:VCreateDetailCellText = cell as! VCreateDetailCellText
        cellText.field.delegate = self
        cellText.field.text = fVideo?.url
        cellText.field.placeholder = placeholder
    }
    
    //MARK: field del
    
    func textFieldDidEndEditing(textField:UITextField)
    {
        let newUrl:String = textField.text!
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            if self != nil
            {
                if self!.fVideo != nil
                {
                    let videoId:String = self!.fVideo!.videoId!
                    let reference:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.Gandaller
                    let propertyVideos:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.Videos.rawValue
                    let propertyVideoUrl:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.VideoUrl.rawValue
                    let notificationId:String? = self!.fVideo!.videoNotification
                    
                    FMain.sharedInstance.database.updateSubProperty(
                        reference,
                        childId:self!.gandallerId,
                        property:propertyVideos,
                        subChildId:videoId,
                        subPropertyId:propertyVideoUrl,
                        value:newUrl)
                    
                    if !newUrl.isEmpty
                    {
                        if notificationId == nil
                        {
                            let propertyVideoNotification:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.VideoNotification.rawValue
                            let news:FDatabaseModelNews = FDatabaseModelNewsVideo(gandallerId:self!.gandallerId, url:newUrl)
                            let newsJson:[String:AnyObject] = news.modelJson()
                            let newsId:String = FMain.sharedInstance.database.createChild(
                                FDatabase.FDatabaseReference.News,
                                json:newsJson)
                            
                            FMain.sharedInstance.database.updateSubProperty(
                                reference,
                                childId:self!.gandallerId,
                                property:propertyVideos,
                                subChildId:videoId,
                                subPropertyId:propertyVideoNotification,
                                value:newsId)
                        }
                        else
                        {
                            let referenceNotification:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.News
                            let propertyNotificationVideo:String = FDatabaseModelNews.FDatabaseModelNewsKey.Url.rawValue
                            
                            FMain.sharedInstance.database.updateProperty(
                                referenceNotification,
                                childId:notificationId!,
                                property:propertyNotificationVideo,
                                value:newUrl)
                        }
                    }
                }
            }
        }
    }
    
    func textFieldShouldReturn(textField:UITextField) -> Bool
    {
        textField.resignFirstResponder()
        
        return true
    }
}
import UIKit

class MCreateItemDetailPropertyItemTextVideo:MCreateItemDetailPropertyItemText
{
    let fVideo:FDatabaseModelGandallerVideo
    private let kPlaceholder:String = ""
    private let kRemoveAble:Bool = true
    
    init(fVideo:FDatabaseModelGandallerVideo, gandallerId:String)
    {
        self.fVideo = fVideo
        super.init(gandallerId:gandallerId, placeholder:kPlaceholder, text:fVideo.url, removeAble:kRemoveAble)
    }
    
    override func changedText(text:String)
    {
        super.changedText(text)
        
        fVideo.url = text
        let videoId:String = fVideo.videoId
        let reference:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.Gandaller
        let propertyVideos:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.Videos.rawValue
        let propertyVideoUrl:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.VideoUrl.rawValue
        let notificationId:String? = fVideo.videoNotification
        
        FMain.sharedInstance.database.updateSubProperty(
            reference,
            childId:gandallerId,
            property:propertyVideos,
            subChildId:videoId,
            subPropertyId:propertyVideoUrl,
            value:text)
        
        if notificationId == nil
        {
            let propertyVideoNotification:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.VideoNotification.rawValue
            let news:FDatabaseModelNews = FDatabaseModelNewsVideo(gandallerId:gandallerId, url:text)
            let newsJson:[String:AnyObject] = news.modelJson()
            let newsId:String = FMain.sharedInstance.database.createChild(
                FDatabase.FDatabaseReference.News,
                json:newsJson)
            fVideo.videoNotification = newsId
            
            FMain.sharedInstance.database.updateSubProperty(
                reference,
                childId:gandallerId,
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
                value:text)
        }
    }
    
    override func performRemove()
    {
        controller.removeVideo(fVideo)
    }
}
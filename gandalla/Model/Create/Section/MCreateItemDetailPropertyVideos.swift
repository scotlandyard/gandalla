import UIKit

class MCreateItemDetailPropertyVideos:MCreateItemDetailProperty
{
    private let kCellHeight:CGFloat = 50
    private let kAddAvailable:Bool = true
    
    override init(gandallerId:String, fModel:FDatabaseModelGandaller)
    {
        let name:String = NSLocalizedString("MCreateItemDetailPropertyVideos_name", comment:"")
        let reusableIdentifier:String = VCreateDetailCellText.reusableIdentifier()
        var items:[MCreateItemDetailPropertyItemTextVideo] = []
        
        for fVideo:FDatabaseModelGandallerVideo in fModel.videos
        {
            let itemVideo:MCreateItemDetailPropertyItemTextVideo = MCreateItemDetailPropertyItemTextVideo(fVideo:fVideo, gandallerId:gandallerId)
            items.append(itemVideo)
        }
        
        items.sortInPlace()
        { (itemA, itemB) -> Bool in
            
            let before:Bool
            let notificationA:String? = itemA.fVideo.videoNotification
            
            if notificationA == nil
            {
                before = false
            }
            else
            {
                before = true
            }
            
            return before
        }
        
        super.init(name:name, reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight, items:items, addAvailable:kAddAvailable)
    }
    
    override func add(controller:CCreateDetail)
    {
        controller.addVideo()
    }
}
import Foundation

class MGandallerDetail
{
    let items:[MGandallerDetailItem]
    
    init(gandaller:MGandallerItem)
    {
        let gandallerId:String = gandaller.gandallerId
        var items:[MGandallerDetailItem] = []
        
        let itemPictures:MGandallerDetailItemPictures = MGandallerDetailItemPictures(gandallerId:gandallerId)
        let itemProfile:MGandallerDetailItemProfile = MGandallerDetailItemProfile(modelGandaller:gandaller)
        
        items.append(itemPictures)
        items.append(itemProfile)
        
        let titlePowers:String = NSLocalizedString("MGandallerDetail_titlePowers", comment:"")
        let itemTitlePowers:MGandallerDetailItemTitle = MGandallerDetailItemTitle(title:titlePowers)
        items.append(itemTitlePowers)
        
        for power:FDatabaseModelGandallerPower in gandaller.fModel.powers
        {
            let power:String = power.name
            let itemPower:MGandallerDetailItemPower = MGandallerDetailItemPower(power:power)
            
            items.append(itemPower)
        }
        
        let itemSocial:MGandallerDetailItemSocial = MGandallerDetailItemSocial(modelGandaller:gandaller)
        items.append(itemSocial)
        
        for hashtag:FDatabaseModelGandallerSocialHashtag in gandaller.fModel.social.hashtags
        {
            let tag:String = hashtag.tag
            let itemHashtag:MGandallerDetailItemHashtag = MGandallerDetailItemHashtag(tag:tag)
            
            items.append(itemHashtag)
        }
        
        for video:FDatabaseModelGandallerVideo in gandaller.fModel.videos
        {
            let url:String = video.url
            let itemVideo:MGandallerDetailItemVideo = MGandallerDetailItemVideo(url:url)
            
            items.append(itemVideo)
        }
        
        self.items = items
    }
}
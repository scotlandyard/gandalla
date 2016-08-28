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
        let itemSocial:MGandallerDetailItemSocial = MGandallerDetailItemSocial(modelGandaller:gandaller)
        
        items.append(itemPictures)
        items.append(itemProfile)
        items.append(itemSocial)
        
        for hashtag:FDatabaseModelGandallerSocialHashtag in gandaller.fModel.social.hashtags
        {
            let tag:String = hashtag.tag
            let itemHashtag:MGandallerDetailItemHashtag = MGandallerDetailItemHashtag(tag:tag)
            
            items.append(itemHashtag)
        }
        
        self.items = items
    }
}
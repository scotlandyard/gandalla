import Foundation

class MGandallerDetail
{
    let items:[MGandallerDetailItem]
    
    init(gandaller:MGandallerItem)
    {
        let titlePowers:String = NSLocalizedString("MGandallerDetail_titlePowers", comment:"")
        let titleHashtags:String = NSLocalizedString("MGandallerDetail_titleHashtags", comment:"")
        let titleVideos:String = NSLocalizedString("MGandallerDetail_titleVideos", comment:"")
        let titleSocial:String = NSLocalizedString("MGandallerDetail_titleSocial", comment:"")
        let titleFacebook:String = gandaller.fModel.social.facebook
        let titleTwitter:String = gandaller.fModel.social.twitter
        let titleInstagram:String = gandaller.fModel.social.instagram
        
        var items:[MGandallerDetailItem] = []
        let itemPictures:MGandallerDetailItemPictures = MGandallerDetailItemPictures(modelGandaller:gandaller)
        let itemProfile:MGandallerDetailItemProfile = MGandallerDetailItemProfile(modelGandaller:gandaller)
        let itemLike:MGandallerDetailItemLike = MGandallerDetailItemLike(modelGandaller:gandaller)
        let itemTitlePowers:MGandallerDetailItemTitle = MGandallerDetailItemTitle(title:titlePowers)
        let itemTitleSocial:MGandallerDetailItemTitle = MGandallerDetailItemTitle(title:titleSocial)
        let itemTitleHashtags:MGandallerDetailItemTitle = MGandallerDetailItemTitle(title:titleHashtags)
        let itemTitleVideos:MGandallerDetailItemTitle = MGandallerDetailItemTitle(title:titleVideos)
        
        items.append(itemPictures)
        items.append(itemProfile)
        items.append(itemLike)
        items.append(itemTitlePowers)
        
        for power:FDatabaseModelGandallerPower in gandaller.fModel.powers
        {
            let power:String = power.name
            
            if !power.isEmpty
            {
                let itemPower:MGandallerDetailItemPower = MGandallerDetailItemPower(power:power)
                items.append(itemPower)
            }
        }
        
        items.append(itemTitleSocial)
        
        if !titleFacebook.isEmpty
        {
            let itemFacebook:MGandallerDetailItemSocialFacebook = MGandallerDetailItemSocialFacebook(title:titleFacebook)
            items.append(itemFacebook)
        }
        
        if !titleTwitter.isEmpty
        {
            let itemTwitter:MGandallerDetailItemSocialTwitter = MGandallerDetailItemSocialTwitter(title:titleTwitter)
            items.append(itemTwitter)
        }
        
        if !titleInstagram.isEmpty
        {
            let itemInstagram:MGandallerDetailItemSocialInstagram = MGandallerDetailItemSocialInstagram(title:titleInstagram)
            items.append(itemInstagram)
        }
        
        items.append(itemTitleHashtags)
        
        var hashtags:[MGandallerDetailItem] = []
        for hashtag:FDatabaseModelGandallerSocialHashtag in gandaller.fModel.social.hashtags
        {
            let tag:String = hashtag.tag
            
            if !tag.isEmpty
            {
                let itemHashtag:MGandallerDetailItemHashtag = MGandallerDetailItemHashtag(tag:tag)
                hashtags.append(itemHashtag)
            }
        }
        
        hashtags.sortInPlace()
        { (itemA, itemB) -> Bool in
            
            let hashA:MGandallerDetailItemHashtag = itemA as! MGandallerDetailItemHashtag
            let hashB:MGandallerDetailItemHashtag = itemB as! MGandallerDetailItemHashtag
            let tagA:String = hashA.tag
            let tagB:String = hashB.tag
            let before:Bool
            let comparisonResult:NSComparisonResult = tagA.compare(
                tagB,
                options:NSStringCompareOptions.CaseInsensitiveSearch,
                range:nil,
                locale:nil)
            
            switch comparisonResult
            {
            case NSComparisonResult.OrderedAscending, NSComparisonResult.OrderedSame:
                
                before = true
                
                break
                
            case NSComparisonResult.OrderedDescending:
                
                before = false
                
                break
            }
            
            return before
        }
        
        items.appendContentsOf(hashtags)
        items.append(itemTitleVideos)
        
        for video:FDatabaseModelGandallerVideo in gandaller.fModel.videos
        {
            let url:String = video.url
            
            if !url.isEmpty
            {
                let itemVideo:MGandallerDetailItemVideo = MGandallerDetailItemVideo(url:url)
                items.append(itemVideo)
            }
        }
        
        self.items = items
    }
}
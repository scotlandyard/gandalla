import UIKit

class MCreateItemDetailPropertySocial:MCreateItemDetailProperty
{
    private let kCellHeight:CGFloat = 50
    private let kAddAvailable:Bool = false
    
    override init(gandallerId:String, fModel:FDatabaseModelGandaller)
    {
        let name:String = NSLocalizedString("MCreateItemDetailPropertySocial_name", comment:"")
        let reusableIdentifier:String = VCreateDetailCellText.reusableIdentifier()
        let facebook:String = fModel.social.facebook
        let twitter:String = fModel.social.twitter
        let instagram:String = fModel.social.instagram
        let itemFacebook:MCreateItemDetailPropertyItemFacebook = MCreateItemDetailPropertyItemFacebook(name:facebook)
        let itemTwitter:MCreateItemDetailPropertyItemTwitter = MCreateItemDetailPropertyItemTwitter(name:twitter)
        let itemInstagram:MCreateItemDetailPropertyItemInstagram = MCreateItemDetailPropertyItemInstagram(name:instagram)
        let items:[MCreateItemDetailPropertyItem] = [
            itemFacebook,
            itemTwitter,
            itemInstagram
        ]
        
        super.init(name:name, reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight, items:items, addAvailable:kAddAvailable)
    }
}
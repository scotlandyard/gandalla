import UIKit

class MCreateItemDetailPropertyHashtags:MCreateItemDetailProperty
{
    private let kCellHeight:CGFloat = 50
    private let kAddAvailable:Bool = true
    
    override init(gandallerId:String, fModel:FDatabaseModelGandaller)
    {
        let name:String = NSLocalizedString("MCreateItemDetailPropertyHashtags_name", comment:"")
        let reusableIdentifier:String = VCreateDetailCellText.reusableIdentifier()
        var items:[MCreateItemDetailPropertyItem] = []
        
        for fHashtag:FDatabaseModelGandallerSocialHashtag in fModel.social.hashtags
        {
            let itemHashtag:MCreateItemDetailPropertyItemHashtag = MCreateItemDetailPropertyItemHashtag(gandallerId:gandallerId, fHashtag:fHashtag)
            items.append(itemHashtag)
        }
        
        super.init(name:name, reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight, items:items, addAvailable:kAddAvailable)
    }
    
    override func add(controller:CCreateDetail)
    {
        controller.addPower()
    }
}
import UIKit

class MCreateItemDetailPropertyHashtags:MCreateItemDetailProperty
{
    private let kCellHeight:CGFloat = 50
    private let kAddAvailable:Bool = true
    
    override init(gandallerId:String, fModel:FDatabaseModelGandaller)
    {
        let name:String = NSLocalizedString("MCreateItemDetailPropertyHashtags_name", comment:"")
        let reusableIdentifier:String = VCreateDetailCellText.reusableIdentifier()
        var items:[MCreateItemDetailPropertyItemTextHashtag] = []
        
        for fHashtag:FDatabaseModelGandallerSocialHashtag in fModel.social.hashtags
        {
            let itemHashtag:MCreateItemDetailPropertyItemTextHashtag = MCreateItemDetailPropertyItemTextHashtag(fHashtag:fHashtag, gandallerId:gandallerId)
            items.append(itemHashtag)
        }
        
        items.sortInPlace()
        { (itemA, itemB) -> Bool in
            
            let before:Bool
            let tagA:String = itemA.fHashtag.tag
            let tagB:String = itemB.fHashtag.tag
            
            if tagA.isEmpty
            {
                before = false
            }
            else if tagB.isEmpty
            {
                before = true
            }
            else
            {
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
                
            }
            
            return before
        }
        
        super.init(name:name, reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight, items:items, addAvailable:kAddAvailable)
    }
    
    override func add(controller:CCreateDetail)
    {
        controller.addHashtag()
    }
}
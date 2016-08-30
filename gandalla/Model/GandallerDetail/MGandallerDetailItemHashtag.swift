import UIKit

class MGandallerDetailItemHashtag:MGandallerDetailItem
{
    let tag:String
    private let kCellHeight:CGFloat = 46
    private let kSelectable:Bool = true
    private let kTwitter:String = "https://twitter.com/hashtag/%@"
    
    init(tag:String)
    {
        self.tag = tag
        let reusableIdentifier:String = VGandallerDetailCellHashtag.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight, selectable:kSelectable)
    }
    
    override func selected(controller:CGandallerDetail)
    {
        let twitterUri:String = String(format:kTwitter, tag)
        let url:NSURL = NSURL(string:twitterUri)!
        UIApplication.sharedApplication().openURL(url)
    }
}
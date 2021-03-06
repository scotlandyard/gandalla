import UIKit

class MGandallerDetailItemVideo:MGandallerDetailItem
{
    let url:String
    private let kCellHeight:CGFloat = 50
    private let kSelectable:Bool = true
    
    init(url:String)
    {
        self.url = url
        let reusableIdentifier:String = VGandallerDetailCellVideo.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight, selectable:kSelectable)
    }
    
    override func selected(controller:CGandallerDetail)
    {
        let urlPath:NSURL = NSURL(string:url)!
        UIApplication.sharedApplication().openURL(urlPath)
    }
}
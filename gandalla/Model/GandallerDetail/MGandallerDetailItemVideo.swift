import UIKit

class MGandallerDetailItemVideo:MGandallerDetailItem
{
    let url:String
    private let kCellHeight:CGFloat = 50
    
    init(url:String)
    {
        self.url = url
        let reusableIdentifier:String = VGandallerDetailCellVideo.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
}
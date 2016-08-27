import UIKit

class MGandallerListItem
{
    weak var fGandaller:FDatabaseModelGandaller?
    private var imageSize:CGFloat
    private let attributedString:NSAttributedString
    private let labelMarginHorizontal:CGFloat = 20
    private let labelMarginVertical:CGFloat = 40
    private let drawingOptions:NSStringDrawingOptions
    
    init(fGandaller:FDatabaseModelGandaller)
    {
        let nameAttributes:[String:AnyObject] = [NSFontAttributeName:UIFont.bold(17)]
        let name:String = fGandaller.name
        self.fGandaller = fGandaller
        imageSize = 0
        drawingOptions = NSStringDrawingOptions([NSStringDrawingOptions.UsesLineFragmentOrigin, NSStringDrawingOptions.UsesFontLeading])
        attributedString = NSAttributedString(
            string:name,
            attributes:nameAttributes)
    }
    
    //MARK: public
    
    func heightForWidth(width:CGFloat) -> CGFloat
    {
        imageSize = width
        let usableWidth:CGFloat = width - labelMarginHorizontal
        let usableSize:CGSize = CGSizeMake(usableWidth, 1000)
        let rect:CGRect = attributedString.boundingRectWithSize(
            usableSize,
            options:drawingOptions,
            context:nil)
        let usableHeight:CGFloat = rect.maxY
        let completeHeight:CGFloat = usableHeight + labelMarginVertical + width
        
        return completeHeight
    }
    
    func config(cell:VGandallersCell)
    {
        
    }
}
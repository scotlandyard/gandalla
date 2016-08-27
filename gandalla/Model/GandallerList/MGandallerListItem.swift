import UIKit

class MGandallerListItem
{
    weak var modelGandaller:MGandallerItem!
    weak var cell:VGandallersCell?
    private var imageHeight:CGFloat
    private var labelHeight:CGFloat
    private let attributedString:NSAttributedString
    private let labelMarginHorizontal:CGFloat = 20
    private let labelMarginVertical:CGFloat = 40
    private let drawingOptions:NSStringDrawingOptions
    
    init(modelGandaller:MGandallerItem)
    {
        let nameAttributes:[String:AnyObject] = [NSFontAttributeName:UIFont.bold(17)]
        let name:String = modelGandaller.fModel.name
        self.modelGandaller = modelGandaller
        imageHeight = 0
        labelHeight = 0
        drawingOptions = NSStringDrawingOptions([NSStringDrawingOptions.UsesLineFragmentOrigin, NSStringDrawingOptions.UsesFontLeading])
        attributedString = NSAttributedString(
            string:name,
            attributes:nameAttributes)
    }
    
    //MARK: public
    
    func heightForWidth(width:CGFloat) -> CGFloat
    {
        imageHeight = width
        let usableWidth:CGFloat = width - labelMarginHorizontal
        let usableSize:CGSize = CGSizeMake(usableWidth, 1000)
        let rect:CGRect = attributedString.boundingRectWithSize(
            usableSize,
            options:drawingOptions,
            context:nil)
        labelHeight = ceil(rect.maxY)
        let completeHeight:CGFloat = labelHeight + labelMarginVertical + width
        
        return completeHeight
    }
    
    func config(cell:VGandallersCell)
    {
        self.cell = cell
        cell.model = self
        cell.label.text = modelGandaller.fModel.name
        layoutConstraints()
        cell.placeImage()
    }
    
    func layoutConstraints()
    {
        cell?.layoutImageHeight.constant = imageHeight
        cell?.layoutLabelHeight.constant = labelHeight
    }
}
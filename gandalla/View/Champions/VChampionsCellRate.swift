import UIKit

class VChampionsCellRate:UIView
{
    weak var label:UILabel!
    let colorBorder:UIColor
    let colorBackground:UIColor
    let colorForeground:UIColor
    private let kLineBorderWidth:CGFloat = 30
    private let kLineBaseWidth:CGFloat = 28
    private let kLineForeWidth:CGFloat = 26
    private let kMargin:CGFloat = 32
    private let deg90:CGFloat = 1.5708
    
    init()
    {
        colorBorder = UIColor(white:0.9, alpha:1)
        colorBackground = UIColor.collectionBackground()
        colorForeground = UIColor.complement()
        
        super.init(frame:CGRectZero)
        userInteractionEnabled = false
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func drawRect(rect:CGRect)
    {
        let width:CGFloat = rect.maxX
        let height:CGFloat = rect.maxY
        let width_2:CGFloat = width / 2.0
        let height_2:CGFloat = height / 2.0
        let diameter:CGFloat
        let radius:CGFloat
        let context:CGContext? = UIGraphicsGetCurrentContext()
        
        if width < height
        {
            diameter = width
        }
        else
        {
            diameter = height
        }
        
        radius = (diameter - kMargin) / 2.0
        CGContextSetLineCap(context, CGLineCap.Round)
        CGContextSetLineWidth(context, kLineBorderWidth)
        CGContextSetStrokeColorWithColor(context, colorBorder.CGColor)
        CGContextAddArc(context, width_2, height_2, radius, deg90, 0, 1)
        CGContextDrawPath(context, CGPathDrawingMode.Stroke)
        CGContextSetLineWidth(context, kLineBaseWidth)
        CGContextSetStrokeColorWithColor(context, colorBackground.CGColor)
        CGContextAddArc(context, width_2, height_2, radius, deg90, 0, 1)
        CGContextDrawPath(context, CGPathDrawingMode.Stroke)
        
        CGContextSetStrokeColorWithColor(context, colorBackground.CGColor)
    }
    
    //MARK: public
    
    func count(percentage:CGFloat)
    {
        
    }
}
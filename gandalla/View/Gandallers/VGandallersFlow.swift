import UIKit

class VGandallersFlow:UICollectionViewFlowLayout
{
    weak var controller:CGandallers!
    var attributes:[UICollectionViewLayoutAttributes]
    private let padding2:CGFloat
    private let padding_2:CGFloat
    private let kMinCols:Int = 2
    private let kMedCols:Int = 3
    private let kMaxCols:Int = 4
    private let kPadding:CGFloat = 4
    private let kCollectionBottom:CGFloat = 40
    
    init(controller:CGandallers)
    {
        padding2 = kPadding + kPadding
        padding_2 = kPadding / 2.0
        attributes = []
        
        super.init()
        self.controller = controller
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func prepareLayout()
    {
        attributes = []
        
        var xOff:[CGFloat] = []
        var yOff:[CGFloat] = []
        let columnWidth:CGFloat
        let cellWidth:CGFloat
        let columns:Int
        let totalItems:Int = controller.model.items.count
        let totalWidth:CGFloat = collectionView!.bounds.maxX
        let totalCellWidth:CGFloat = totalWidth / kPadding
        var currentColumn:Int = 0
        var totalHeight:CGFloat = 0
        
        if totalWidth < 500
        {
            columns = kMinCols
        }
        else if totalWidth < 800
        {
            columns = kMedCols
        }
        else
        {
            columns = kMaxCols
        }
        
        columnWidth = totalCellWidth / CGFloat(columns)
        cellWidth = columnWidth - kPadding
        
        for index:Int in 0 ..< columns
        {
            let addedPadding:CGFloat
            
            if index > 0
            {
                addedPadding = kPadding
            }
            else
            {
                addedPadding = 0
            }
            
            let xItem:CGFloat = (CGFloat(index) * columnWidth) + addedPadding
            let yItem:CGFloat = kPadding
            xOff.append(xItem)
            yOff.append(yItem)
        }
        
        for index:Int in 0 ..< totalItems
        {
            let model:MGandallerListItem = controller.model.items[index]
            currentColumn = index % columns
            let indexPath:NSIndexPath = NSIndexPath(forItem:currentColumn, inSection:0)
            let height:CGFloat = model.heightForWidth(cellWidth)
            let heightPadding:CGFloat = height + padding2
            let x:CGFloat = xOff[currentColumn]
            let y:CGFloat = yOff[currentColumn]
            let frame:CGRect = CGRectMake(x, y, columnWidth, heightPadding)
            let inset:CGRect = CGRectInset(frame, padding_2, kPadding)
            let colY:CGFloat = y + heightPadding
            let attribute:UICollectionViewLayoutAttributes = UICollectionViewLayoutAttributes(forCellWithIndexPath:indexPath)
            attribute.frame = inset
            attributes.append(attribute)
            totalHeight = fmax(totalHeight, colY)
            yOff[currentColumn] = colY
        }
        
        totalHeight += kCollectionBottom
    }
}
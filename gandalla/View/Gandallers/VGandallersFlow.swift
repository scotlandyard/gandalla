import UIKit

class VGandallersFlow:UICollectionViewFlowLayout
{
    weak var controller:CGandallers!
    private var attributes:[UICollectionViewLayoutAttributes]
    private var totalWidth:CGFloat
    private var totalHeight:CGFloat
    private let padding2:CGFloat
    private let padding_2:CGFloat
    private let kMinCols:Int = 2
    private let kMedCols:Int = 3
    private let kMaxCols:Int = 4
    private let kPadding:CGFloat = 4
    private let kCollectionBottom:CGFloat = 10
    private let kCollectionTop:CGFloat = 64
    
    init(controller:CGandallers)
    {
        padding2 = kPadding + kPadding
        padding_2 = kPadding / 2.0
        attributes = []
        totalWidth = 0
        totalHeight = 0
        
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
        let columnWidth_padding:CGFloat
        let columns:Int
        let totalItems:Int = controller.model.items.count
        totalWidth = collectionView!.bounds.maxX
        var currentColumn:Int = 0
        totalHeight = 0
        
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
        
        columnWidth = totalWidth / CGFloat(columns)
        columnWidth_padding = columnWidth - (kPadding + padding_2)
        
        for index:Int in 0 ..< columns
        {
            let xItem:CGFloat
            
            if index == 0
            {
                xItem = kPadding
            }
            else
            {
                let indexFloat:CGFloat = CGFloat(index)
                xItem = (indexFloat * columnWidth) + padding_2
            }
            
            let yItem:CGFloat = kCollectionTop + kPadding
            xOff.append(xItem)
            yOff.append(yItem)
        }
        
        for index:Int in 0 ..< totalItems
        {
            let model:MGandallerListItem = controller.model.items[index]
            currentColumn = index % columns
            let indexPath:NSIndexPath = NSIndexPath(forItem:index, inSection:0)
            let height:CGFloat = model.heightForWidth(columnWidth_padding)
            let heightPadding:CGFloat = height + padding2
            let x:CGFloat = xOff[currentColumn]
            let y:CGFloat = yOff[currentColumn]
            let frame:CGRect = CGRectMake(x, y, columnWidth_padding, heightPadding)
            let inset:CGRect = CGRectInset(frame, 0, padding_2)
            let colY:CGFloat = y + heightPadding
            let attribute:UICollectionViewLayoutAttributes = UICollectionViewLayoutAttributes(forCellWithIndexPath:indexPath)
            attribute.frame = inset
            attributes.append(attribute)
            totalHeight = fmax(totalHeight, colY)
            yOff[currentColumn] = colY
        }
        
        totalHeight += kCollectionBottom
    }
    
    override func collectionViewContentSize() -> CGSize
    {
        let size:CGSize = CGSizeMake(totalWidth, totalHeight)
        
        return size
    }
    
    override func layoutAttributesForElementsInRect(rect:CGRect) -> [UICollectionViewLayoutAttributes]?
    {
        var array:[UICollectionViewLayoutAttributes]?
        
        for attribute:UICollectionViewLayoutAttributes in attributes
        {
            let attrRect:CGRect = attribute.frame
            
            if CGRectIntersectsRect(attrRect, rect)
            {
                if array == nil
                {
                    array = []
                }
                
                array!.append(attribute)
            }
        }
        
        return array
    }
}
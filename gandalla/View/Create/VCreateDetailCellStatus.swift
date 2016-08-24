import UIKit

class VCreateDetailCellStatus:VCreateDetailCell
{
    weak var segmented:UISegmentedControl!
    weak var layoutSegmentedLeft:NSLayoutConstraint!
    private let kSegmentedWidth:CGFloat = 160
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        
        let itemActive:String = NSLocalizedString("VCreateDetailCellStatus_itemActive", comment:"")
        let itemPaused:String = NSLocalizedString("VCreateDetailCellStatus_itemPaused", comment:"")
        let items:[String] = [
            itemPaused,
            itemActive
        ]
        
        let segmented:UISegmentedControl = UISegmentedControl(items:items)
        segmented.clipsToBounds = true
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.tintColor = UIColor.complement()
        self.segmented = segmented
        
        addSubview(segmented)
        
        let views:[String:AnyObject] = [
            "segmented":segmented]
        
        let metrics:[String:AnyObject] = [
            "segmentedWidth":kSegmentedWidth]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[segmented(segmentedWidth)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[segmented(32)]-23-|",
            options:[],
            metrics:metrics,
            views:views))
        
        layoutSegmentedLeft = NSLayoutConstraint(
            item:segmented,
            attribute:NSLayoutAttribute.Left,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Left,
            multiplier:1,
            constant:0)
        
        addConstraint(layoutSegmentedLeft)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.maxX
        let remain:CGFloat = width - kSegmentedWidth
        let margin:CGFloat = remain / 2.0
        layoutSegmentedLeft.constant = margin
        
        super.layoutSubviews()
    }
}
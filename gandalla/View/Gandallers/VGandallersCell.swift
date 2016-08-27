import UIKit

class VGandallersCell:UICollectionViewCell
{
    weak var base:UIView!
    private let kCornerRadius:CGFloat = 4
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
        
        let base:UIView = UIView()
        base.userInteractionEnabled = false
        base.clipsToBounds = true
        base.translatesAutoresizingMaskIntoConstraints = false
        base.backgroundColor = UIColor.whiteColor()
        base.layer.cornerRadius = kCornerRadius
        self.base = base
        
        addSubview(base)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}
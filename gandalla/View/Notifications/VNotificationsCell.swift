import UIKit

class VNotificationsCell:UICollectionViewCell
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    //MARK: public
    
    func config(model:MNotificationsItem)
    {
    }
}
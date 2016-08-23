import UIKit

class VCreateDetailCellActivate:VCreateDetailCell
{
    weak var check:UISwitch!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let check:UISwitch = UISwitch()
        check.translatesAutoresizingMaskIntoConstraints = false
        check.onTintColor = UIColor.complement()
        self.check = check
        
        addSubview(check)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}
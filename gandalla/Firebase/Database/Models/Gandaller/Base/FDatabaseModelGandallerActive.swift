import UIKit

class FDatabaseModelGandallerActive:FDatabaseModelGandaller
{
    init()
    {
        let status:FDatabaseModelGandallerStatus = FDatabaseModelGandallerStatus.Active
        super.init(status:status)
    }
    
    override func statusColor() -> UIColor
    {
        let color:UIColor = UIColor.complement()
        
        return color
    }
}
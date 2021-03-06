import UIKit

class FDatabaseModelGandallerActive:FDatabaseModelGandaller
{
    init(json:[String:AnyObject])
    {
        let status:FDatabaseModelGandallerStatus = FDatabaseModelGandallerStatus.Active
        super.init(status:status, json:json)
    }
    
    override func statusColor() -> UIColor
    {
        let color:UIColor = UIColor.complement()
        
        return color
    }
}
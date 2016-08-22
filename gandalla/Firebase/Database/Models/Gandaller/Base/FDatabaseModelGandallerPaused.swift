import UIKit

class FDatabaseModelGandallerPaused:FDatabaseModelGandaller
{
    init()
    {
        let status:FDatabaseModelGandallerStatus = FDatabaseModelGandallerStatus.Paused
        super.init(status:status)
    }
    
    init(json:[String:AnyObject])
    {
        let status:FDatabaseModelGandallerStatus = FDatabaseModelGandallerStatus.Paused
        super.init(status:status, json:json)
    }
    
    override func statusColor() -> UIColor
    {
        let color:UIColor = UIColor(white:0.88, alpha:1)
        
        return color
    }
}
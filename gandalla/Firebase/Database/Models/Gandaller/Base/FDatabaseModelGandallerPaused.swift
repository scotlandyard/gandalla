import UIKit

class FDatabaseModelGandallerPaused:FDatabaseModelGandaller
{
    init()
    {
        let status:FDatabaseModelGandallerStatus = FDatabaseModelGandallerStatus.Paused
        super.init(status:status)
    }
    
    override func statusColor() -> UIColor
    {
        let color:UIColor = UIColor(white:0.9, alpha:1)
        
        return color
    }
}
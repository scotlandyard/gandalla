import UIKit

class MCreateItemDetailPropertyItemStarted:MCreateItemDetailPropertyItem
{
    var started:Bool
    
    init(started:Bool)
    {
        self.started = started
    }
    
    override func config(controller:CCreateDetail, cell:VCreateDetailCell)
    {
        super.config(controller, cell:cell)
        
        let cellStarted:VCreateDetailCellStarted = cell as! VCreateDetailCellStarted
        cellStarted.check.setOn(started, animated:false)
        
        if started
        {
            cellStarted.check.userInteractionEnabled = false
        }
        else
        {
            cellStarted.check.addTarget(self, action:#selector(self.actionCheck(sender:)), forControlEvents:UIControlEvents.ValueChanged)
        }
    }
    
    //MARK: actions
    
    func actionCheck(sender check:UISwitch)
    {
        if check.on
        {
            check.userInteractionEnabled = false
            let gandallerId:String = controller.model.gandallerId
            let property:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.Started.rawValue
            started = true
            
            FMain.sharedInstance.database.updateGandaller(gandallerId, property:property, value:started)
        }
    }
}
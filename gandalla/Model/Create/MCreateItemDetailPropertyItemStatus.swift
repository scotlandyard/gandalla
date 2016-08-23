import UIKit

class MCreateItemDetailPropertyItemStatus:MCreateItemDetailPropertyItem
{
    var status:FDatabaseModelGandaller.FDatabaseModelGandallerStatus
    
    init(status:FDatabaseModelGandaller.FDatabaseModelGandallerStatus)
    {
        self.status = status
    }
    
    override func config(controller:CCreateDetail, cell:VCreateDetailCell)
    {
        super.config(controller, cell:cell)
        
        let cellStatus:VCreateDetailCellStatus = cell as! VCreateDetailCellStatus
        cellStatus.segmented.selectedSegmentIndex = status.rawValue
        cellStatus.segmented.addTarget(self, action:#selector(self.actionSegmented(sender:)), forControlEvents:UIControlEvents.ValueChanged)
    }
    
    //MARK: actions
    
    @objc func actionSegmented(sender segmented:UISegmentedControl)
    {
        
    }
}
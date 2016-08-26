import UIKit

class MCreateItemDetailPropertyItemStatus:MCreateItemDetailPropertyItem
{
    var status:FDatabaseModelGandaller.FDatabaseModelGandallerStatus
    
    init(status:FDatabaseModelGandaller.FDatabaseModelGandallerStatus)
    {
        self.status = status
        super.init()
    }
    
    override func config(controller:CCreateDetail, cell:VCreateDetailCell)
    {
        super.config(controller, cell:cell)
        
        let cellStatus:VCreateDetailCellStatus = cell as! VCreateDetailCellStatus
        cellStatus.segmented.selectedSegmentIndex = status.rawValue
        cellStatus.model = self
    }
    
    //MARK: public
    
    func changeStatus(segmentedSelected:Int)
    {
        let gandallerId:String = controller.model.gandaller.gandallerId
        let property:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.Status.rawValue
        status = FDatabaseModelGandaller.FDatabaseModelGandallerStatus(rawValue:segmentedSelected)!
        
        FMain.sharedInstance.database.updateProperty(FDatabase.FDatabaseReference.Gandaller, childId:gandallerId, property:property, value:segmentedSelected)
    }
}
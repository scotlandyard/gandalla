import UIKit

class MCreateItem
{
    weak var fModel:FDatabaseModelGandaller!
    let gandallerId:String
    
    init(gandaller:MGandallerItem)
    {
        gandallerId = gandaller.gandallerId
        fModel = gandaller.fModel
    }
    
    //MARK: public
    
    func config(cell:VCreateCell)
    {
        var gandallerName:String = fModel.name
        
        if gandallerName.isEmpty
        {
            gandallerName = NSLocalizedString("MCreateItem_noName", comment:"")
        }
        
        cell.imageStatus.tintColor = fModel.statusColor()
        cell.labelName.text = gandallerName
    }
    
    func selected(controller:CCreate)
    {
        let detailModel:MCreateItemDetail = MCreateItemDetail(model:self)
        let detail:CCreateDetail = CCreateDetail(model:detailModel)
        let transition:MMainTransition = MMainTransition.Push(fModel.name)
        controller.parent.pushController(detail, transition:transition)
    }
}
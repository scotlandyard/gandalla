import UIKit

class MCreateItem
{
    weak var gandaller:MGandallerItem!
    
    init(gandaller:MGandallerItem)
    {
        self.gandaller = gandaller
    }
    
    //MARK: public
    
    func config(cell:VCreateCell)
    {
        var gandallerName:String = gandaller.fModel.name
        
        if gandallerName.isEmpty
        {
            gandallerName = NSLocalizedString("MCreateItem_noName", comment:"")
        }
        
        cell.imageStatus.tintColor = gandaller.fModel.statusColor()
        cell.labelName.text = gandallerName
    }
    
    func selected(controller:CCreate)
    {
        let detailModel:MCreateItemDetail = MCreateItemDetail(model:self)
        let detail:CCreateDetail = CCreateDetail(model:detailModel)
        let gandallerName:String = gandaller.fModel.name
        let transition:MMainTransition = MMainTransition.Push(gandallerName)
        controller.parent.pushController(detail, transition:transition)
    }
}
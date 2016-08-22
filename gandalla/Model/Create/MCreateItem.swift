import UIKit

class MCreateItem
{
    let fModel:FDatabaseModelGandaller
    let gandallerId:String
    
    init(gandallerId:String, fModel:FDatabaseModelGandaller)
    {
        self.gandallerId = gandallerId
        self.fModel = fModel
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
        
    }
}
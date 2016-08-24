import Foundation

class MCreateItemDetail
{
    let gandallerId:String
    let properties:[MCreateItemDetailProperty]
    
    init(model:MCreateItem)
    {
        let fModel:FDatabaseModelGandaller = model.gandaller.fModel
        let propertyStatus:MCreateItemDetailPropertyStatus = MCreateItemDetailPropertyStatus(fModel:fModel)
        let propertyStarted:MCreateItemDetailPropertyStarted = MCreateItemDetailPropertyStarted(fModel:fModel)
        let propertyName:MCreateItemDetailPropertyName = MCreateItemDetailPropertyName(fModel:fModel)
        gandallerId = model.gandaller.gandallerId
        
        properties = [
            propertyStatus,
            propertyStarted,
            propertyName
        ]
    }
}
import Foundation

class MCreateItemDetail
{
    let gandallerId:String
    let properties:[MCreateItemDetailProperty]
    
    init(model:MCreateItem)
    {
        let fModel:FDatabaseModelGandaller = model.fModel
        let propertyStatus:MCreateItemDetailPropertyStatus = MCreateItemDetailPropertyStatus(fModel:fModel)
        let propertyName:MCreateItemDetailPropertyName = MCreateItemDetailPropertyName(fModel:fModel)
        gandallerId = model.gandallerId
        
        properties = [
            propertyStatus,
            propertyName
        ]
    }
}
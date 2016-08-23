import Foundation

class MCreateItemDetail
{
    let properties:[MCreateItemDetailProperty]
    
    init(model:MCreateItem)
    {
        let propertyStatus:MCreateItemDetailPropertyStatus = MCreateItemDetailPropertyStatus()
        let propertyName:MCreateItemDetailPropertyName = MCreateItemDetailPropertyName()
        
        properties = [
            propertyStatus,
            propertyName
        ]
    }
}
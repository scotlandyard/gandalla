import Foundation

class MCreateItemDetail
{
    var properties:[MCreateItemDetailProperty]
    weak var gandaller:MGandallerItem!
    
    init(model:MCreateItem)
    {
        gandaller = model.gandaller
        properties = []
    }
    
    //MARK: public
    
    func generate()
    {
        let gandallerId:String = gandaller.gandallerId
        let fModel:FDatabaseModelGandaller = gandaller.fModel
        let propertyStatus:MCreateItemDetailPropertyStatus = MCreateItemDetailPropertyStatus(gandallerId:gandallerId, fModel:fModel)
        let propertyStarted:MCreateItemDetailPropertyStarted = MCreateItemDetailPropertyStarted(gandallerId:gandallerId, fModel:fModel)
        let propertyName:MCreateItemDetailPropertyName = MCreateItemDetailPropertyName(gandallerId:gandallerId, fModel:fModel)
        let propertyImages:MCreateItemDetailPropertyImages = MCreateItemDetailPropertyImages(gandallerId:gandallerId, fModel:fModel)
        
        properties = [
            propertyStatus,
            propertyStarted,
            propertyName,
            propertyImages
        ]
    }
}
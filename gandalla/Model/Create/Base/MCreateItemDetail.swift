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
        let fModel:FDatabaseModelGandaller = gandaller.fModel
        let propertyStatus:MCreateItemDetailPropertyStatus = MCreateItemDetailPropertyStatus(fModel:fModel)
        let propertyStarted:MCreateItemDetailPropertyStarted = MCreateItemDetailPropertyStarted(fModel:fModel)
        let propertyName:MCreateItemDetailPropertyName = MCreateItemDetailPropertyName(fModel:fModel)
        let propertyImages:MCreateItemDetailPropertyImages = MCreateItemDetailPropertyImages(fModel:fModel)
        
        properties = [
            propertyStatus,
            propertyStarted,
            propertyName,
            propertyImages
        ]
    }
}
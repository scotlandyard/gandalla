import Foundation

class MCreateItemDetail
{
    let gandallerId:String
    var properties:[MCreateItemDetailProperty]
    weak var model:MCreateItem!
    
    init(model:MCreateItem)
    {
        self.model = model
        gandallerId = model.gandaller.gandallerId
        properties = []
    }
    
    //MARK: public
    
    func generate()
    {
        let fModel:FDatabaseModelGandaller = model.gandaller.fModel
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
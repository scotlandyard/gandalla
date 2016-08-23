import UIKit

class MGandallerItem
{
    let gandallerId:String
    var fModel:FDatabaseModelGandaller
    var image:UIImage?
    
    init(gandallerId:String, fModel:FDatabaseModelGandaller)
    {
        self.gandallerId = gandallerId
        self.fModel = fModel
    }
    
    //MARK: public
    
    func copy() -> MGandallerItem
    {
        let duplicated:MGandallerItem = MGandallerItem(gandallerId:gandallerId, fModel:fModel)
        
        return duplicated
    }
}
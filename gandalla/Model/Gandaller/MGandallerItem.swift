import Foundation

class MGandallerItem
{
    let gandallerId:String
    private(set) var fModel:FDatabaseModelGandaller
    
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
    
    func update(fModel:FDatabaseModelGandaller)
    {
        self.fModel = fModel
    }
}
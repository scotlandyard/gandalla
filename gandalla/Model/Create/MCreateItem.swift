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
        
    }
}
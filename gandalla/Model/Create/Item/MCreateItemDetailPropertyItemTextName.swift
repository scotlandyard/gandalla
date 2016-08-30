import UIKit

class MCreateItemDetailPropertyItemTextName:MCreateItemDetailPropertyItemText
{
    weak var fModel:FDatabaseModelGandaller?
    let gandallerId:String
    private let kRemoveAble:Bool = false
    
    init(fModel:FDatabaseModelGandaller, gandallerId:String)
    {
        self.fModel = fModel
        self.gandallerId = gandallerId
        let gandallerName:String = fModel.name
        super.init(placeholder:"", text:gandallerName, removeAble:kRemoveAble)
    }
    
    override func changedText(text:String)
    {
        super.changedText(text)
        fModel?.name = text
        let property:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.Name.rawValue
        
        FMain.sharedInstance.database.updateProperty(
            FDatabase.FDatabaseReference.Gandaller,
            childId:gandallerId,
            property:property,
            value:text)
    }
}
import UIKit

class MCreateItemDetailPropertyItemTextName:MCreateItemDetailPropertyItemText
{
    weak var fModel:FDatabaseModelGandaller?
    private let kPlaceholder:String = ""
    private let kRemoveAble:Bool = false
    
    init(fModel:FDatabaseModelGandaller, gandallerId:String)
    {
        self.fModel = fModel
        let gandallerName:String = fModel.name
        super.init(gandallerId:gandallerId, placeholder:kPlaceholder, text:gandallerName, removeAble:kRemoveAble)
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
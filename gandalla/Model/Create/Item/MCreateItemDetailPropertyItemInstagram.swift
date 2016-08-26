import UIKit

class MCreateItemDetailPropertyItemInstagram:MCreateItemDetailPropertyItem, UITextFieldDelegate
{
    var name:String
    
    init(name:String)
    {
        self.name = name
        super.init()
    }
    
    override func config(controller:CCreateDetail, cell:VCreateDetailCell)
    {
        super.config(controller, cell:cell)
        
        let cellText:VCreateDetailCellText = cell as! VCreateDetailCellText
        cellText.field.delegate = self
        cellText.field.text = name
    }
    
    //MARK: field del
    
    func textFieldDidEndEditing(textField:UITextField)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            let name:String = textField.text!
            
            if self != nil
            {
                self!.name = name
                let reference:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.Gandaller
                let gandallerId:String = self!.controller.model.gandaller.gandallerId
                let subProperty:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.Social.rawValue
                let subChild:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.SocialInstagram.rawValue
                let property:String = "\(subProperty)/\(subChild)"
                
                FMain.sharedInstance.database.updateProperty(
                    reference,
                    childId:gandallerId,
                    property:property,
                    value:name)
            }
        }
    }
    
    func textFieldShouldReturn(textField:UITextField) -> Bool
    {
        textField.resignFirstResponder()
        
        return true
    }
}
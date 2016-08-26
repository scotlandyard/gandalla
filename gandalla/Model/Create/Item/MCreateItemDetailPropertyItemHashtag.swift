import UIKit

class MCreateItemDetailPropertyItemHashtag:MCreateItemDetailPropertyItem, UITextFieldDelegate
{
    let gandallerId:String
    var fHashtag:FDatabaseModelGandallerSocialHashtag?
    
    init(gandallerId:String, fHashtag:FDatabaseModelGandallerSocialHashtag)
    {
        self.gandallerId = gandallerId
        self.fHashtag = fHashtag
        
        super.init()
    }
    
    override func config(controller:CCreateDetail, cell:VCreateDetailCell)
    {
        super.config(controller, cell:cell)
        
        let cellText:VCreateDetailCellText = cell as! VCreateDetailCellText
        cellText.field.delegate = self
        cellText.field.text = fHashtag?.tag
    }
    
    //MARK: field del
    
    func textFieldDidEndEditing(textField:UITextField)
    {
        let newTag:String = textField.text!
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            if self != nil
            {
                if self!.fHashtag != nil
                {
                    let hashtagId:String = self!.fHashtag!.hashtagId!
                    let reference:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.Gandaller
                    let propertySocial:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.Social.rawValue
                    let propertySocialHashtags:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.SocialHashtags.rawValue
                    
                    FMain.sharedInstance.database.updateSubProperty(
                        reference,
                        childId:self!.gandallerId,
                        property:propertySocial,
                        subChildId:propertySocialHashtags,
                        subPropertyId:hashtagId,
                        value:newTag)
                }
            }
        }
    }
    
    func textFieldShouldReturn(textField:UITextField) -> Bool
    {
        textField.resignFirstResponder()
        
        return true
    }
}
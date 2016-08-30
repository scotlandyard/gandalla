import UIKit

class MCreateItemDetailPropertyItemTextHashtag:MCreateItemDetailPropertyItemText
{
    var fHashtag:FDatabaseModelGandallerSocialHashtag?
    private let kPlaceholder:String = ""
    private let kRemoveAble:Bool = false
    
    init(fHashtag:FDatabaseModelGandallerSocialHashtag, gandallerId:String)
    {
        self.fHashtag = fHashtag
        super.init(gandallerId:gandallerId, placeholder:kPlaceholder, text:fSocial.instagram, removeAble:kRemoveAble)
    }
    
    override func changedText(text:String)
    {
        super.changedText(text)
        
        fSocial?.instagram = text
        let reference:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.Gandaller
        let subProperty:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.Social.rawValue
        let subChild:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.SocialInstagram.rawValue
        let property:String = "\(subProperty)/\(subChild)"
        
        FMain.sharedInstance.database.updateProperty(
            reference,
            childId:gandallerId,
            property:property,
            value:text)
    }
    
    
    
    
    
    
    let gandallerId:String
    var fHashtag:FDatabaseModelGandallerSocialHashtag?
    let placeholder:String
    
    init(gandallerId:String, fHashtag:FDatabaseModelGandallerSocialHashtag)
    {
        self.gandallerId = gandallerId
        self.fHashtag = fHashtag
        placeholder = ""
        super.init()
    }
    
    override func config(controller:CCreateDetail, cell:VCreateDetailCell)
    {
        super.config(controller, cell:cell)
        
        let cellText:VCreateDetailCellText = cell as! VCreateDetailCellText
        cellText.field.resignFirstResponder()
        cellText.field.delegate = self
        cellText.field.text = fHashtag?.tag
        cellText.field.placeholder = placeholder
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
                    self!.fHashtag!.tag = newTag
                    let hashtagId:String = self!.fHashtag!.hashtagId!
                    let reference:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.Gandaller
                    let propertySocial:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.Social.rawValue
                    let propertySocialHashtags:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.SocialHashtags.rawValue
                    let hashtagName:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.SocialHashtagName.rawValue
                    let hashtagIdName:String = "\(hashtagId)/\(hashtagName)"
                    
                    FMain.sharedInstance.database.updateSubProperty(
                        reference,
                        childId:self!.gandallerId,
                        property:propertySocial,
                        subChildId:propertySocialHashtags,
                        subPropertyId:hashtagIdName,
                        value:newTag)
                }
            }
        }
    }
}
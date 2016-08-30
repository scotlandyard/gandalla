import UIKit

class MCreateItemDetailPropertyItemTextInstagram:MCreateItemDetailPropertyItemText
{
    let gandallerId:String
    var fSocial:FDatabaseModelGandallerSocial?
    private let kRemoveAble:Bool = false
    
    init(fSocial:FDatabaseModelGandallerSocial, gandallerId:String)
    {
        self.fSocial = fSocial
        self.gandallerId = gandallerId
        let placeholder:String = NSLocalizedString("MCreateItemDetailPropertyItemInstagram_placeholder", comment:"")
        super.init(placeholder:placeholder, text:fSocial.instagram, removeAble:kRemoveAble)
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
}
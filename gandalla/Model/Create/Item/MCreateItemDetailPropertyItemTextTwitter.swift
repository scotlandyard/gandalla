import UIKit

class MCreateItemDetailPropertyItemTextTwitter:MCreateItemDetailPropertyItemText
{
    let fSocial:FDatabaseModelGandallerSocial
    private let kRemoveAble:Bool = false
    
    init(fSocial:FDatabaseModelGandallerSocial, gandallerId:String)
    {
        self.fSocial = fSocial
        let placeholder:String = NSLocalizedString("MCreateItemDetailPropertyItemTwitter_placeholder", comment:"")
        super.init(gandallerId:gandallerId, placeholder:placeholder, text:fSocial.twitter, removeAble:kRemoveAble)
    }
    
    override func changedText(text:String)
    {
        super.changedText(text)
        
        fSocial.twitter = text
        let reference:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.Gandaller
        let subProperty:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.Social.rawValue
        let subChild:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.SocialTwitter.rawValue
        let property:String = "\(subProperty)/\(subChild)"
        
        FMain.sharedInstance.database.updateProperty(
            reference,
            childId:gandallerId,
            property:property,
            value:text)
    }
}
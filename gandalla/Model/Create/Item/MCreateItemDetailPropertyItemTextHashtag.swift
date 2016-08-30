import UIKit

class MCreateItemDetailPropertyItemTextHashtag:MCreateItemDetailPropertyItemText
{
    let fHashtag:FDatabaseModelGandallerSocialHashtag
    private let kPlaceholder:String = ""
    private let kRemoveAble:Bool = true
    
    init(fHashtag:FDatabaseModelGandallerSocialHashtag, gandallerId:String)
    {
        self.fHashtag = fHashtag
        super.init(gandallerId:gandallerId, placeholder:kPlaceholder, text:fHashtag.tag, removeAble:kRemoveAble)
    }
    
    override func changedText(text:String)
    {
        super.changedText(text)
        
        fHashtag.tag = text
        let hashtagId:String = fHashtag.hashtagId
        let reference:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.Gandaller
        let propertySocial:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.Social.rawValue
        let propertySocialHashtags:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.SocialHashtags.rawValue
        let hashtagName:String = FDatabaseModelGandaller.FDatabaseModelGandallerKey.SocialHashtagName.rawValue
        let hashtagIdName:String = "\(hashtagId)/\(hashtagName)"
        
        FMain.sharedInstance.database.updateSubProperty(
            reference,
            childId:gandallerId,
            property:propertySocial,
            subChildId:propertySocialHashtags,
            subPropertyId:hashtagIdName,
            value:text)
    }
}
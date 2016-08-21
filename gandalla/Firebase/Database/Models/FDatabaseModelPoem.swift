import Foundation

class FDatabaseModelPoem:FDatabaseModel
{
    let title:String
    let userId:String
    let created:Int
    let lastEdited:Int
    let likes:Int
    let kKeyTitle:String = "title"
    let kKeyUserId:String = "user_id"
    let kKeyCreated:String = "created"
    let kKeyLastEdit:String = "last_edit"
    let kKeyLikes:String = "likes"
    
    init()
    {
        title = ""
        userId = ""
        created = 0
        lastEdited = 0
        likes = 0
    }
    
    init(title:String)
    {
        self.title = title
        likes = 0
        userId = ""
        
        let now:NSTimeInterval = NSDate().timeIntervalSince1970
        created = Int(now)
        lastEdited = Int(now)
    }
    
    init(json:[String:AnyObject])
    {
        title = json[kKeyTitle] as! String
        userId = json[kKeyUserId] as! String
        created = json[kKeyCreated] as! Int
        lastEdited = json[kKeyLastEdit] as! Int
        likes = json[kKeyLikes] as! Int
    }
    
    //MARK: public
    
    func modelJson() -> [String:AnyObject]
    {
        let dict:[String:AnyObject] = [
            kKeyTitle:title,
            kKeyUserId:userId,
            kKeyCreated:created,
            kKeyLastEdit:lastEdited,
            kKeyLikes:likes
        ]
        
        return dict
    }
}
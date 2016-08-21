import Foundation

class FDatabaseModelUser:FDatabaseModel
{
    let name:String
    let kKeyName:String = "name"
    
    init()
    {
        name = ""
    }
    
    init(snapshot:AnyObject?)
    {
        let json:[String:AnyObject]? = snapshot as? [String:AnyObject]
        
        if json != nil
        {
            name = json![kKeyName] as! String
        }
        else
        {
            name = ""
        }
    }
    
    //MARK: public
    
    func modelJson() -> [String:AnyObject]
    {
        let dict:[String:AnyObject] = [
            kKeyName:name
        ]
        
        return dict
    }
}
import Foundation
import CoreData

@objc(DGandallaUser)
class DGandallaUser:NSManagedObject
{
    @NSManaged var userId:String
    @NSManaged var likedGandaller:[DGandallaGandaller]
    
    override class func entityName() -> String
    {
        return "User"
    }
}
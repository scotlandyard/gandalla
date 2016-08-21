import Foundation
import CoreData

@objc(DGandallaGandaller)
class DGandallaGandaller:NSManagedObject
{
    @NSManaged var gandallerId:String
    @NSManaged var name:String
    @NSManaged var userLiked:DGandallaUser?
    
    override class func entityName() -> String
    {
        return "Gandaller"
    }
}
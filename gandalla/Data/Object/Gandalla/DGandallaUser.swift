import Foundation
import CoreData

@objc(DGandallaLike)
class DGandallaLike:NSManagedObject
{
    @NSManaged var latitude:Double
    @NSManaged var longitude:Double
    @NSManaged var locationProject:DPokePassProject?
    
    override class func entityName() -> String
    {
        return "Location"
    }
}
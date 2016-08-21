import Foundation

class DManager
{
    static let sharedInstance = DManager()
    let managerGandalla:DManagerModelGandalla
    
    private init()
    {
        managerGandalla = DManagerModelGandalla()
    }
}
import UIKit

class MGandallerItemImage
{
    let gandallerId:String
    var imageId:String?
    var imageBinary:UIImage?
    
    init(gandallerId:String)
    {
        self.gandallerId = gandallerId
    }
    
    //MARK: public
    
    func getImage(imageId:String)
    {
        self.imageId = imageId
        imageBinary = nil
    }
}
import UIKit

class CCreateDetail:CMainController
{
    let model:MCreateItemDetail
    weak var viewDetail:VCreateDetail!
    
    init(model:MCreateItemDetail)
    {
        self.model = model
        
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func loadView()
    {
        let viewDetail:VCreateDetail = VCreateDetail(controller:self)
        self.viewDetail = viewDetail
        view = viewDetail
    }
    
    //MARK: public
    
    func addImage()
    {
        
    }
    
    func removeImage(model:MCreateItemDetailPropertyItemImage)
    {
        
    }
}
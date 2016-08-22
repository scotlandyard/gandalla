import UIKit

class CCreateDetail:CMainController
{
    weak var model:MCreateItem!
    weak var viewDetail:VCreateDetail!
    
    convenience init(model:MCreateItem)
    {
        self.init()
        self.model = model
    }
    
    override func loadView()
    {
        let viewDetail:VCreateDetail = VCreateDetail(controller:self)
        self.viewDetail = viewDetail
        view = viewDetail
    }
}
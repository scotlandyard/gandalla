import UIKit

class CGandallerDetail:CMainController
{
    weak var viewDetail:VGandallerDetail!
    weak var model:MGandallerItem!
    
    init(model:MGandallerItem)
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
        let viewDetail:VGandallerDetail = VGandallerDetail(controller:self)
        self.viewDetail = viewDetail
        view = viewDetail
    }
}
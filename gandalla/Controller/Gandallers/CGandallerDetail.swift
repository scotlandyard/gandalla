import UIKit

class CGandallerDetail:CMainController
{
    weak var viewDetail:VGandallerDetail!
    let model:MGandallerDetail
    
    init(gandaller:MGandallerItem)
    {
        model = MGandallerDetail(gandaller:gandaller)
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
import UIKit

class CCreate:CMainController
{
    weak var viewCreate:VCreate!
    let model:MCreate
    
    init()
    {
        model = MCreate()
        
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func loadView()
    {
        let viewCreate:VCreate = VCreate(controller:self)
        self.viewCreate = viewCreate
        view = viewCreate
    }
}
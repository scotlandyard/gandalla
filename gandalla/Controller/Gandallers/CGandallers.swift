import UIKit

class CGandallers:CMainController
{
    weak var viewGandallers:VGandallers!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func loadView()
    {
        let viewGandallers:VGandallers = VGandallers(controller:self)
        self.viewGandallers = viewGandallers
        view = viewGandallers
    }
}
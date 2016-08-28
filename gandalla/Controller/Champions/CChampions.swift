import UIKit

class CChampions:CMainController
{
    var model:MChampions?
    weak var viewChampions:VChampions!
 
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func loadView()
    {
        let viewChampions:VChampions = VChampions(controller:self)
        self.viewChampions = viewChampions
        view = viewChampions
    }
    
    //MARK: public
    
    func showGandaller(index:NSIndexPath)
    {
        let champion:MChampionsItem = model!.items[index.item]
        let item:MGandallerItem = champion.modelGandaller
        let gandallerName:String = item.fModel.name
        let controller:CGandallerDetail = CGandallerDetail(gandaller:item)
        let transition:MMainTransition = MMainTransition.Push(gandallerName)
        parent.pushController(controller, transition:transition)
    }
}
import UIKit

class CLiked:CMainController
{
    let model:MLiked
    weak var viewLiked:VLiked!
    
    init()
    {
        model = MLiked()
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func viewDidAppear(animated:Bool)
    {
        super.viewDidAppear(animated)
        
        parent.scrollDidScroll(viewLiked.collection)
    }
    
    override func loadView()
    {
        let viewLiked:VLiked = VLiked(controller:self)
        self.viewLiked = viewLiked
        view = viewLiked
    }
    
    //MARK: public
    
    func showGandaller(index:NSIndexPath)
    {
        let liked:MLikedItem = model!.items[index.item]
        let item:MGandallerItem = liked.modelGandaller
        let gandallerName:String = item.fModel.name
        let controller:CGandallerDetail = CGandallerDetail(gandaller:item)
        let transition:MMainTransition = MMainTransition.Push(gandallerName)
        parent.pushController(controller, transition:transition)
    }
}
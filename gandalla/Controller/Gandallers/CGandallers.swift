import UIKit

class CGandallers:CMainController
{
    weak var viewGandallers:VGandallers!
    let model:MGandallerList
    
    init()
    {
        model = MGandallerList()
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        generateModel()
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector:#selector(self.notifiedGandallersUpdated(sender:)),
            name:NSNotification.NSNotificationName.GandallersLoaded.rawValue,
            object:nil)
    }
    
    override func viewDidAppear(animated:Bool)
    {
        super.viewDidAppear(animated)
        
        parent.scrollDidScroll(viewGandallers.collection)
    }
    
    override func loadView()
    {
        let viewGandallers:VGandallers = VGandallers(controller:self)
        self.viewGandallers = viewGandallers
        view = viewGandallers
    }
    
    //MARK: notified
    
    func notifiedGandallersUpdated(sender notification:NSNotification)
    {
        generateModel()
    }
    
    //MARK: private
    
    private func generateModel()
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            self?.model.load()
            
            dispatch_async(dispatch_get_main_queue())
            { [weak self] in
                
                self?.viewGandallers.refresh()
            }
        }
    }
    
    //MARK: public
    
    func showGandaller(index:NSIndexPath)
    {
        let listItem:MGandallerListItem = model.items[index.item]
        let item:MGandallerItem = listItem.modelGandaller
        let gandallerName:String = item.fModel.name
        let controller:CGandallerDetail = CGandallerDetail(model:item)
        let transition:MMainTransition = MMainTransition.Push(gandallerName)
        parent.pushController(controller, transition:transition)
    }
}
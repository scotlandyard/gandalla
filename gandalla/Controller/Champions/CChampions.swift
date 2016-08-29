import UIKit

class CChampions:CMainController
{
    var model:MChampions?
    weak var viewChampions:VChampions!
 
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        loadChampions()
    }
    
    override func viewDidAppear(animated:Bool)
    {
        super.viewDidAppear(animated)
        
        parent.scrollDidScroll(viewChampions.collection)
    }
    
    override func loadView()
    {
        let viewChampions:VChampions = VChampions(controller:self)
        self.viewChampions = viewChampions
        view = viewChampions
    }
    
    //MARK: private
    
    private func loadChampions()
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        {
            let reference:FDatabase.FDatabaseReference = FDatabase.FDatabaseReference.Like
            
            FMain.sharedInstance.database.listenParentOnce(
                reference)
            { [weak self] (snapshot) in
                
                let json:[String:AnyObject]? = snapshot.value as? [String:AnyObject]
                
                if json != nil
                {
                    self?.model = MChampions(json:json!)
                    self?.viewChampions.championsLoaded()
                }
            }
        }
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
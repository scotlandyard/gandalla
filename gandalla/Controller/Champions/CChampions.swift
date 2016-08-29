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
            
            let handler:UInt = FMain.sharedInstance.database.listenParent(
                reference)
            { [weak self] (snapshot) in
                
                let json:[String:AnyObject] = snapshot.value as! [String:AnyObject]
                self?.model = MChampions(json:json)
                self?.viewChampions.championsLoaded()
            }
            
            FMain.sharedInstance.database.stopListeningParent(reference, handler:handler)
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
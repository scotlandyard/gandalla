import UIKit

class CChampions:CMainController
{
    var model:MChampions?
    weak var viewChampions:VChampions!
    
    override func loadView()
    {
        let viewChampions:VChampions = VChampions(controller:self)
        self.viewChampions = viewChampions
        view = viewChampions
    }
}
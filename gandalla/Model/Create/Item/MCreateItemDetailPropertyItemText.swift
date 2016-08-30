import UIKit

class MCreateItemDetailPropertyItemText:MCreateItemDetailPropertyItem
{
    let removeAble:Bool
    let placeholder:String
    var text:String
    
    init(placeholder:String, text:String, removeAble:Bool)
    {
        self.placeholder = placeholder
        self.text = text
        self.removeAble = removeAble
        super.init()
    }
    
    override func config(controller:CCreateDetail, cell:VCreateDetailCell)
    {
        super.config(controller, cell:cell)
        
        let cellText:VCreateDetailCellText = cell as! VCreateDetailCellText
        cellText.field.resignFirstResponder()
        cellText.model = self
        cellText.field.text = text
        cellText.field.placeholder = placeholder
        cellText.removeAble(removeAble)
    }
    
    //MARK: public
    
    func changedText(text:String)
    {
        self.text = text
    }
}
import UIKit

class MCreateItemDetailPropertyItemText:MCreateItemDetailPropertyItem
{
    let placeholder:String
    var text:String
    
    init(placeholder:String, text:String)
    {
        self.placeholder = placeholder
        self.text = text
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
    }
    
    //MARK: public
    
    func changedText(text:String)
    {
        self.text = text
    }
}
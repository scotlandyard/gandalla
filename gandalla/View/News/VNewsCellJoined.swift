import UIKit

class VNewsCellJoined:VNewsCell
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func config(model:MNewsItem)
    {
        super.config(model)
        
        labelEvent.text = NSLocalizedString("VNewsCellJoined_labelEvent", comment:"")
    }
}
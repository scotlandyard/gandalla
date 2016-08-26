import UIKit

class VCreateDetailHeader:UICollectionReusableView
{
    weak var labelName:UILabel!
    weak var buttonAdd:UIButton!
    weak var model:MCreateItemDetailProperty!
    weak var controller:CCreateDetail!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
        
        let labelName:UILabel = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.backgroundColor = UIColor.clearColor()
        labelName.font = UIFont.bold(14)
        labelName.textColor = UIColor(white:0.4, alpha:1)
        labelName.userInteractionEnabled = false
        labelName.numberOfLines = 0
        labelName.textAlignment = NSTextAlignment.Center
        self.labelName = labelName
        
        let buttonAdd:UIButton = UIButton()
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        buttonAdd.setImage(UIImage(named:"createListAdd"), forState:UIControlState.Normal)
        buttonAdd.imageView?.contentMode = UIViewContentMode.Center
        buttonAdd.imageView?.clipsToBounds = true
        buttonAdd.addTarget(self, action:#selector(self.actionAdd(sender:)), forControlEvents:UIControlEvents.TouchUpInside)
        self.buttonAdd = buttonAdd
        
        addSubview(labelName)
        addSubview(buttonAdd)
        
        let views:[String:AnyObject] = [
            "labelName":labelName,
            "buttonAdd":buttonAdd]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-10-[labelName]-10-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-10-[labelName]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[buttonAdd(70)]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-10-[buttonAdd]-0-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    //MARK: actions
    
    func actionAdd(sender button:UIButton)
    {
        model.add(controller)
    }
    
    //MARK: public
    
    func config(controller:CCreateDetail, model:MCreateItemDetailProperty)
    {
        self.model = model
        self.controller = controller
        labelName.text = model.name
        
        if model.addAvailable
        {
            buttonAdd.hidden = false
        }
        else
        {
            buttonAdd.hidden = true
        }
    }
}
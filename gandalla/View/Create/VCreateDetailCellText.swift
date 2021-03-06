import UIKit

class VCreateDetailCellText:VCreateDetailCell, UITextFieldDelegate
{
    weak var model:MCreateItemDetailPropertyItemText?
    weak var field:UITextField!
    weak var buttonRemove:UIButton!
    weak var layoutButtonRemoveWidth:NSLayoutConstraint!
    weak var layoutFieldMargin:NSLayoutConstraint!
    private let kButtonRemoveWidth:CGFloat = 50
    private let kFieldMargin:CGFloat = 10
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        backgroundColor = UIColor.whiteColor()
        
        let color:UIColor = UIColor.blackColor()
        let field:UITextField = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.clipsToBounds = true
        field.backgroundColor = UIColor.clearColor()
        field.borderStyle = UITextBorderStyle.None
        field.font = UIFont.bold(15)
        field.textColor = color
        field.tintColor = color
        field.returnKeyType = UIReturnKeyType.Next
        field.keyboardAppearance = UIKeyboardAppearance.Light
        field.autocorrectionType = UITextAutocorrectionType.No
        field.spellCheckingType = UITextSpellCheckingType.No
        field.autocapitalizationType = UITextAutocapitalizationType.None
        field.clearButtonMode = UITextFieldViewMode.Never
        field.delegate = self
        self.field = field
        
        let buttonRemove:UIButton = UIButton()
        buttonRemove.translatesAutoresizingMaskIntoConstraints = false
        buttonRemove.setImage(UIImage(named:"createListRemove"), forState:UIControlState.Normal)
        buttonRemove.imageView?.contentMode = UIViewContentMode.Center
        buttonRemove.imageView?.clipsToBounds = true
        buttonRemove.addTarget(self, action:#selector(self.actionRemove(sender:)), forControlEvents:UIControlEvents.TouchUpInside)
        self.buttonRemove = buttonRemove
        
        addSubview(field)
        addSubview(buttonRemove)
        
        let views:[String:AnyObject] = [
            "field":field,
            "buttonRemove":buttonRemove]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[field]-10-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[buttonRemove]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[field]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[buttonRemove]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        
        layoutButtonRemoveWidth = NSLayoutConstraint(
            item:buttonRemove,
            attribute:NSLayoutAttribute.Width,
            relatedBy:NSLayoutRelation.Equal,
            toItem:nil,
            attribute:NSLayoutAttribute.NotAnAttribute,
            multiplier:1,
            constant:0)
        layoutFieldMargin = NSLayoutConstraint(
            item:field,
            attribute:NSLayoutAttribute.Left,
            relatedBy:NSLayoutRelation.Equal,
            toItem:buttonRemove,
            attribute:NSLayoutAttribute.Right,
            multiplier:1,
            constant:0)
        
        addConstraint(layoutButtonRemoveWidth)
        addConstraint(layoutFieldMargin)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    //MARK: actions
    
    func actionRemove(sender button:UIButton)
    {
        UIApplication.sharedApplication().keyWindow?.endEditing(true)
        model?.remove()
    }
    
    //MARK: field del
    
    func textFieldDidEndEditing(textField:UITextField)
    {
        let newText:String =  textField.text!
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            self?.model?.changedText(newText)
        }
    }
    
    func textFieldShouldReturn(textField:UITextField) -> Bool
    {
        textField.resignFirstResponder()
        
        return true
    }
    
    //MARK: public
    
    func removeAble(able:Bool)
    {
        if able
        {
            layoutButtonRemoveWidth.constant = kButtonRemoveWidth
            layoutFieldMargin.constant = 0
        }
        else
        {
            layoutButtonRemoveWidth.constant = 0
            layoutFieldMargin.constant = kFieldMargin
        }
    }
}
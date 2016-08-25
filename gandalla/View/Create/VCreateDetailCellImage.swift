import UIKit

class VCreateDetailCellImage:VCreateDetailCell
{
    weak var image:UIImageView!
    weak var layoutRemoveLeft:NSLayoutConstraint!
    weak var buttonImage:UIButton!
    weak var buttonAdd:UIButton!
    weak var buttonRemove:UIButton!
    weak var spinner:VMainLoader!
    let picker:UIImagePickerController
    private let kButtonSize:CGFloat = 40
    private let kImageWidth:CGFloat = 80
    private let kInterItem:CGFloat = 10
    private let itemsWidth:CGFloat
    
    override init(frame:CGRect)
    {
        itemsWidth = kButtonSize + kInterItem + kImageWidth + kInterItem + kButtonSize
        picker = UIImagePickerController()
        picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        super.init(frame:frame)
        
        let spinner:VMainLoader = VMainLoader()
        spinner.stopAnimating()
        self.spinner = spinner
        
        let image:UIImageView = UIImageView()
        image.userInteractionEnabled = false
        image.contentMode = UIViewContentMode.ScaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.backgroundColor = UIColor(white:0.9, alpha:1)
        image.layer.cornerRadius = 4
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor(white:0, alpha:0.4).CGColor
        self.image = image
        
        let buttonImage:UIButton = UIButton()
        buttonImage.translatesAutoresizingMaskIntoConstraints = false
        buttonImage.setImage(UIImage(named:"createListImage"), forState:UIControlState.Normal)
        buttonImage.imageView?.contentMode = UIViewContentMode.Center
        buttonImage.imageView?.clipsToBounds = true
        self.buttonImage = buttonImage
        
        let buttonRemove:UIButton = UIButton()
        buttonRemove.translatesAutoresizingMaskIntoConstraints = false
        buttonRemove.setImage(UIImage(named:"createListRemove"), forState:UIControlState.Normal)
        buttonRemove.imageView?.contentMode = UIViewContentMode.Center
        buttonRemove.imageView?.clipsToBounds = true
        self.buttonRemove = buttonRemove
        
        let buttonAdd:UIButton = UIButton()
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        buttonAdd.setImage(UIImage(named:"createListAdd"), forState:UIControlState.Normal)
        buttonAdd.imageView?.contentMode = UIViewContentMode.Center
        buttonAdd.imageView?.clipsToBounds = true
        self.buttonAdd = buttonAdd
        
        addSubview(buttonRemove)
        addSubview(buttonAdd)
        addSubview(image)
        addSubview(buttonImage)
        addSubview(spinner)
        
        let views:[String:AnyObject] = [
            "buttonAdd":buttonAdd,
            "buttonRemove":buttonRemove,
            "buttonImage":buttonImage,
            "image":image,
            "spinner":spinner]
        
        let metrics:[String:AnyObject] = [
            "buttonSize":kButtonSize,
            "imageWidth":kImageWidth,
            "interItem":kInterItem]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[buttonRemove(buttonSize)]-(interItem)-[image(imageWidth)]-(interItem)-[buttonAdd(buttonSize)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[buttonRemove]-(interItem)-[buttonImage(imageWidth)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[spinner]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[buttonRemove]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-(interItem)-[buttonImage]-(interItem)-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[buttonAdd]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-(interItem)-[image]-(interItem)-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[spinner]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        
        layoutRemoveLeft = NSLayoutConstraint(
            item:buttonRemove,
            attribute:NSLayoutAttribute.Left,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Left,
            multiplier:1,
            constant:0)
        
        addConstraint(layoutRemoveLeft)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func layoutSubviews()
    {
        let totalWidth:CGFloat = bounds.maxX
        let remain:CGFloat = totalWidth - itemsWidth
        let margin:CGFloat = remain / 2.0
        layoutRemoveLeft.constant = margin
        
        super.layoutSubviews()
    }
    
    //MARK: public
    
    func showLoading()
    {
        dispatch_async(dispatch_get_main_queue())
        { [weak self] in
            
            self?.spinner.startAnimating()
            self?.buttonImage.hidden = true
            self?.image.hidden = true
            self?.buttonRemove.hidden = true
            self?.buttonAdd.hidden = true
        }
    }
    
    func hideLoading()
    {
        dispatch_async(dispatch_get_main_queue())
        { [weak self] in
            
            self?.spinner.stopAnimating()
            self?.buttonImage.hidden = false
            self?.image.hidden = false
            self?.buttonRemove.hidden = false
            self?.buttonAdd.hidden = false
        }
    }
}
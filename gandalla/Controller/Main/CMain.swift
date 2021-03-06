import UIKit

@UIApplicationMain
class AppDelegate:UIResponder, UIApplicationDelegate
{
    var window:UIWindow?
    private weak var parent:CMainParent!

    func application(application:UIApplication, didFinishLaunchingWithOptions launchOptions:[NSObject:AnyObject]?) -> Bool
    {
        FMain.sharedInstance.load()
        let window = UIWindow(frame:UIScreen.mainScreen().bounds)
        window.makeKeyAndVisible()
        window.backgroundColor = UIColor.whiteColor()
        
        let parent:CMainParent = CMainParent()
        window.rootViewController = parent
        self.window = window
        
        return true
    }
}
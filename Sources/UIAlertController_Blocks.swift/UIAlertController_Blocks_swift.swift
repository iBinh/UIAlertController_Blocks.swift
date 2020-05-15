import UIKit

public let UIAlertControllerBlocksCancelButtonIndex:Int = 0
public let UIAlertControllerBlocksDestructiveButtonIndex:Int = 1
public let UIAlertControllerBlocksFirstOtherButtonIndex:Int = 2


public extension UIAlertController {
    typealias UIAlertControllerCompletionBlock = ((UIAlertController, UIAlertAction, Int) -> ())
    class func show(title: String?,
                    message: String?,
                    preferredStyle: UIAlertController.Style,
                    cancelButtonTitle: String?,
                    destructiveButtonTitle: String?,
                    otherButtonTitles: [String]?,
                    popoverPresentationControllerBlock: @escaping (UIPopoverPresentationController?)->Void,
                    tapBlock: @escaping UIAlertControllerCompletionBlock) {
        
        let strongController: UIAlertController = self.init(title: title,
                                                            message: message,
                                                            preferredStyle: preferredStyle)
        
        weak var controller:UIAlertController! = strongController
        
        if (cancelButtonTitle != nil) {
            let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel) { (action) in
                tapBlock(controller, action, UIAlertControllerBlocksCancelButtonIndex)
            }
            
            controller.addAction(cancelAction)
        }
        
        if (destructiveButtonTitle != nil) {
            let destructiveAction = UIAlertAction(title: destructiveButtonTitle, style: .destructive) { (action) in
                tapBlock(controller, action, UIAlertControllerBlocksDestructiveButtonIndex)
            }
            controller.addAction(destructiveAction)
        }
        if let otherButtonTitles = otherButtonTitles {
            for i in 0...otherButtonTitles.count - 1 {
                let otherButtonTitle = otherButtonTitles[i]
                let otherAction = UIAlertAction(title: otherButtonTitle, style: .default) { (action) in
                    tapBlock(controller, action, UIAlertControllerBlocksFirstOtherButtonIndex + i)
                }
                controller.addAction(otherAction)
            }
        }
        
        
        popoverPresentationControllerBlock(controller.popoverPresentationController)
        
        
        UIViewController.topMost()?.present(controller, animated:true, completion:nil)
        
    }
    
    class func showAlert(title: String?,
                         message: String?,
                         cancelButtonTitle: String?,
                         destructiveButtonTitle: String?,
                         otherButtonTitles: [String]?,
                         popoverPresentationControllerBlock: @escaping (UIPopoverPresentationController?)->Void,
                         tapBlock: @escaping UIAlertControllerCompletionBlock) {
        
        self.show(title: title,
                  message: message,
                  preferredStyle: .alert,
                  cancelButtonTitle: cancelButtonTitle,
                  destructiveButtonTitle: destructiveButtonTitle,
                  otherButtonTitles: otherButtonTitles,
                  popoverPresentationControllerBlock: popoverPresentationControllerBlock,
                  tapBlock: tapBlock)
    }
    
    class func showActionSheet(title: String? = nil,
                               message: String? = nil,
                               cancelButtonTitle: String? = nil,
                               destructiveButtonTitle: String? = nil,
                               otherButtonTitles: [String]? = nil,
                               popoverPresentationControllerBlock: @escaping (UIPopoverPresentationController?)->Void,
                               tapBlock: @escaping UIAlertControllerCompletionBlock) {
        
        self.show(title: title,
                  message: message,
                  preferredStyle: .actionSheet,
                  cancelButtonTitle: cancelButtonTitle,
                  destructiveButtonTitle: destructiveButtonTitle,
                  otherButtonTitles: otherButtonTitles,
                  popoverPresentationControllerBlock: popoverPresentationControllerBlock,
                  tapBlock: tapBlock)
        
    }
        
    
    var cancelButtonIndex: Int {
        return UIAlertControllerBlocksCancelButtonIndex
    }
    
    var firstOtherButtonIndex: Int {
        return UIAlertControllerBlocksFirstOtherButtonIndex
    }
    
    var destructiveButtonIndex: Int {
        return UIAlertControllerBlocksDestructiveButtonIndex
    }
}

public extension UIViewController {
    
    class func topMost() -> UIViewController? {
        
        if var topController = UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        
        return nil
    }
}

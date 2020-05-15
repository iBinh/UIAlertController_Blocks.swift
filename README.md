# UIAlertController_Blocks.swift

## Installation

### Cocoapods
UIAlertController_Blocks.swift is available through [CocoaPods](https://cocoapods.org/pods/UIAlertController_Blocks.swift). To install
it, simply add the following line to your Podfile:

```ruby
pod 'UIAlertController_Blocks.swift'
```
### Swift Package Manager
Add `https://github.com/iBinh/UIAlertController_Blocks.swift.git` to Package Manager 
## Usage

### Show ActionSheet
```swift    
UIAlertController.showActionSheet(title: "Title", message: "Message", cancelButtonTitle: "Cancel", destructiveButtonTitle: "Delete", otherButtonTitles: ["First Button", "Second Button"], popoverPresentationControllerBlock: { (popover) in
    popover?.sourceView = self.someButton
    popover?.sourceRect = self.someButton.bounds
}) { (controller, action, index) in
    if index == controller.firstOtherButtonIndex {
        // do some stuff
    } else if index == controller.firstOtherButtonIndex + 1 {
        // do some stuff
    } else if index == controller.destructiveButtonIndex {
        // do some stuff
    } 
    // do some stuff
}     
```

### Show Alert

```swift    
UIAlertController.showAlert(title: "Title", message: "Message", cancelButtonTitle: "Cancel", destructiveButtonTitle: "Delete", otherButtonTitles: ["First Button", "Second Button"], popoverPresentationControllerBlock: { (popover) in
    popover?.sourceView = self.someButton
    popover?.sourceRect = self.someButton.bounds
}) { (controller, action, index) in
    if index == controller.firstOtherButtonIndex {
        // do some stuff
    } else if index == controller.firstOtherButtonIndex + 1 {
        // do some stuff
    } else if index == controller.destructiveButtonIndex {
        // do some stuff
    } 
    // do some stuff
}     
```

## Author
Inspired from [ryanmaxwell/UIAlertController-Blocks](https://github.com/ryanmaxwell/UIAlertController-Blocks)

ntbinh2121, ntbinh21@gmail.com

## License

UIAlertController_Blocks.swift is available under the MIT license. See the LICENSE file for more info.

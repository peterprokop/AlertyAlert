[![Build Status](https://travis-ci.org/peterprokop/AlertyAlert.svg?branch=master)](https://travis-ci.org/peterprokop/AlertyAlert)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

# AlertyAlert

AlertyAlert is a custom alert controller implementation which is:
- Simple
- Customizable
- Nice
- Fluffy

## Features

Typical AlertyAlert usage examples:

### Classical alert

![Classical alert](http://i.imgur.com/ZySARNE.png)

Code:
```swift
let alert = Alerty.default.alert(withTitle: "Title", message: "Message")
            
// You can use different action styles just like with regular *UIAlertController*
let action1 = AlertyAction(title: "Default style action", style: .default, handler: {
    _ in
    print("action1")
})
let action2 = AlertyAction(title: "Destructive style action", style: .destructive, handler: {
    _ in
    print("action2")
})
let action3 = AlertyAction(title: "Cancel style action", style: .cancel, handler: {
    _ in
    print("action3")
})

alert.addAction(action1)
alert.addAction(action2)
alert.addAction(action3)

self.present(alert, animated: true, completion: nil)
```

### Customized alert
Most of the alert parts can be customized - fonts, colors, corner radius, even alert header!

![Force update alert](http://i.imgur.com/iR4SnZv.png)

Code:
```swift
// Create custom style and tweak it a bit
let style = AlertyStyle()
style.cornerRadius = 5
style.backgroundColor =  UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)

style.titleFont = UIFont(name: "MocharyPERSONALUSEONLY", size: 32)
style.messageFont = UIFont(name: "MocharyPERSONALUSEONLY", size: 24)

let textColor = UIColor(red: 0.098, green: 0.584, blue: 0.678, alpha: 1)
style.titleColor = textColor
style.messageColor = textColor

style.cancelActionStyle = AlertyActionStyle(font: UIFont(name: "MocharyPERSONALUSEONLY", size: 18)!, tintColor: UIColor.brown)

// Init new *Alerty* with our style
let alerty = Alerty(style: style)

// Load alert header from *.xib*
let header = Bundle.main.loadNibNamed("SampleAlertHeader", owner: nil, options: nil)![0] as! UIView

let title = "Avertissement du lieutenant politiquement correct"
let message = "Votre message pourrait être offensive pour les autochtones de la région de Yamal.\nVeuillez corriger votre message."

// Use our custom *alerty* instead of *Alerty.default*
let alert = alerty.alert(withTitle: title, message: message)
let closeAction = AlertyAction(title: "I don't understand French!", style: .cancel, handler: nil)

alert.addAction(closeAction)
alert.addHeader(header)

self.present(alert, animated: true, completion: nil)
```

### Force update alert
You can disable alert dismissal for certain actions

![Force update alert](http://i.imgur.com/ft5HAWU.png)

Code:
```swift
let alert = Alerty.default.alert(withTitle: "Warning!", message: "Please update your application ASAP!")

// If *shallDismissAlert* set to *false*, alert will not be dismissed
var updateAction = AlertyAction(title: "This one doesn't dismiss alert", style: .default, handler: {
    _ in
    print("updateAction")
})
updateAction.shallDismissAlert = false

alert.addAction(updateAction)
self.present(alert, animated: true, completion: nil)
```

## Installation

### Manual
Just clone and drop `AlertyAlert/AlertyAlert` subfolder to your project/workspace.

### Carthage
* `> Cartfile`
* `nano Cartfile`
* put `github "peterprokop/AlertyAlert" == 0.2.0` (or latest version) into Cartfile
* Save it: `ctrl-x`, `y`, `enter`
* Run `carthage update`
* Copy `AlertyAlert.framework` from `Carthage/Build/iOS` to your project
* Make sure that you add framewrok to copy carthage frameworks build phase
* Add `import AlertyAlert` on top of your view controller's code

### Cocoapods
- Make sure that you use latest stable Cocoapods version: `pod --version`
- If not, update it: `sudo gem install cocoapods`
- `pod init` in you project root dir
- `nano Podfile`, add:

```
pod 'AlertyAlert', '~> 0.2.1'
``` 
- Save it: `ctrl-x`, `y`, `enter`
- `pod update`
- Open generated `.xcworkspace`
- Don't forget to import AlertyAlert: `import AlertyAlert`!

## Requirements

- iOS 9.0+
- Xcode 8.0+
- Swift 3.0

## Other Projects

- [SwiftOverlays](https://github.com/peterprokop/SwiftOverlays) - Swift GUI library for displaying various popups and notifications.
- [StarryStars](https://github.com/peterprokop/StarryStars) - iOS GUI library for displaying and editing ratings.

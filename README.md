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

### Cocoapods

Cocoapods will be supported in the nearest future

## Installation

### Manual
Just clone and drop `AlertyAlert/AlertyAlert` subfolder to your project/workspace.

### Carthage
* `> Cartfile`
* `nano Cartfile`
* put `github "peterprokop/AlertyAlert" == 0.0.1` (or latest version) into Cartfile
* Save it: `ctrl-x`, `y`, `enter`
* Run `carthage update`
* Copy `AlertyAlert.framework` from `Carthage/Build/iOS` to your project
* Make sure that you add framewrok to copy carthage frameworks build phase
* Add `import AlertyAlert` on top of your view controller's code

## Requirements

- iOS 9.0+
- Xcode 8.0+
- Swift 3.0

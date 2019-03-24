import PlaygroundSupport
import SpriteKit
import UIKit

let frame = CGRect(x: 0, y: 0, width: 600, height: 500)
let midPoint = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)


var scene = Hello(size: frame.size)
let view = SKView(frame: frame)
view.presentScene(scene)

PlaygroundPage.current.liveView = view

//SFUIText-Medium
//SFUIDisplay-Semibold
//SFUIDisplay-Regular
//SFUIText-regular
//SFUIDisplay-Thin
//SFUIDisplay-Light
//SFUIText-Semibold

// https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_markup_formatting_ref/index.html#//apple_ref/doc/uid/TP40016497

// https://medium.freecodecamp.org/how-to-make-something-with-swift-playgrounds-33e560b84184

// 


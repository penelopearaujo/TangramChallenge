import PlaygroundSupport
import SpriteKit
import UIKit

let frame = CGRect(x: 0, y: 0, width: 600, height: 500)
let midPoint = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)


var scene = HelloScene(size: frame.size)
let view = SKView(frame: frame)
view.presentScene(scene)

PlaygroundPage.current.liveView = view





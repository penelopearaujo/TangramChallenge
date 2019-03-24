/*:
 # Tangram Challenge
 ![Playground Icon](tangram.png width="200" height="200")
 
 ### About
 
 Tangram Challenge is a puzzle game for teaching children logical thinking basic geometric shapes and logical thinking. This game was made using SpriteKit and UIKit frameworks.

 ### Gameplay
 
 First, the child has to associate the names of the geometric shapes to the corresponding shape. Then, the child has to use the shapes to solve a challenge and create a rocket!
 
 ### Requirements
 
 To play the game, you have to build and interact with the Playground in the latest release of XCode (10.1).
 
 ---
 */

import PlaygroundSupport
import SpriteKit
import UIKit

let frame = CGRect(x: 0, y: 0, width: 600, height: 500)
let midPoint = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)


var scene = HelloScene(size: frame.size)
let view = SKView(frame: frame)
view.presentScene(scene)

PlaygroundPage.current.liveView = view





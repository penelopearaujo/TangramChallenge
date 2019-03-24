import Foundation
import SpriteKit
import UIKit
import AVFoundation

var backgroundMusic = AVAudioPlayer()

public class HelloScene: SKScene{
    
    let helloLabel = SKLabelNode()
    let puzzleLabel = SKLabelNode()
    
    let tangramImage = SKSpriteNode(imageNamed: "tangram")
    
    let letsGoButton = SKShapeNode()
    let letsGoButtonLabel = SKLabelNode()
    
    override public func didMove(to view: SKView) {
        
        self.backgroundColor = #colorLiteral(red: 0.9882352941, green: 1, blue: 0.9176470588, alpha: 1)
        
        self.tangramImage.scale(to: CGSize(width: 180, height: 180))
        self.tangramImage.position = CGPoint(x:self.frame.midX, y:self.frame.midY - 50)
        self.addChild(tangramImage)
        
        self.createButton()
        self.setLabels()
        
    }
    
    func setLabels(){
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineBreakMode = .byWordWrapping
        
        let helloString = NSMutableAttributedString(string: "Hello! I'm called Tangram ☺️", attributes: [NSMutableAttributedString.Key.font : UIFont.systemFont(ofSize: 35, weight: .heavy)])
        let puzzleString = NSMutableAttributedString(string: "I'm a chinese puzzle originated centuries ago. Let's learn more about me?", attributes: [NSMutableAttributedString.Key.font : UIFont.systemFont(ofSize: 28, weight: .ultraLight), NSMutableAttributedString.Key.paragraphStyle: paragraphStyle])

        self.helloLabel.attributedText = helloString
        self.helloLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 130)
        self.addChild(helloLabel)
        
        self.puzzleLabel.attributedText = puzzleString
        self.puzzleLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 50)
        self.puzzleLabel.numberOfLines = 2
        self.puzzleLabel.preferredMaxLayoutWidth = 480
        self.addChild(puzzleLabel)
    }
    
    func createButton(){
        // set button to next scene
        let letsButtonString = NSMutableAttributedString(string: "Let's go!", attributes: [NSMutableAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .heavy), .foregroundColor : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
        self.letsGoButton.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 200, height: 35), cornerRadius: 20).cgPath
        self.letsGoButton.position = CGPoint(x:self.frame.midX - 100, y:self.frame.midY - 210)
        self.letsGoButton.fillColor = #colorLiteral(red: 0.5176470588, green: 0.6470588235, blue: 0.6156862745, alpha: 1)
        self.letsGoButton.lineWidth = 1
        self.letsGoButton.strokeColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        self.letsGoButtonLabel.attributedText = letsButtonString
        self.letsGoButtonLabel.position = CGPoint(x: letsGoButton.frame.midX, y: letsGoButton.frame.midY-8)
        
        self.addChild(letsGoButton)
        self.addChild(letsGoButtonLabel)
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        // set button to next scene
        if self.letsGoButton.contains(touchLocation) {
            let sceneMoveTo = SecondScene(size: self.size)
            sceneMoveTo.scaleMode = self.scaleMode
            
            let transition = SKTransition.moveIn(with: .up, duration: 0.3)
            self.scene?.view?.presentScene(sceneMoveTo ,transition: transition)
            
        }
        
    }
    
}

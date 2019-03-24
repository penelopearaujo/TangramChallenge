import Foundation
import SpriteKit
import UIKit
import AVFoundation

public class EndScene: SKScene{
    
    let restartButton = SKShapeNode()
    let restartButtonLabel = SKLabelNode()
    
    let tangramImage = SKSpriteNode(imageNamed: "tangram")

    let congratsLabel = SKLabelNode()
    let greatLabel = SKLabelNode()

    
    override public func didMove(to view: SKView) {
        
        self.backgroundColor = #colorLiteral(red: 0.9882352941, green: 1, blue: 0.9176470588, alpha: 1)
        
        self.tangramImage.scale(to: CGSize(width: 180, height: 180))
        self.tangramImage.position = CGPoint(x:self.frame.midX, y:self.frame.midY - 60)
        self.addChild(tangramImage)
        
        self.createRestartButton()
        self.setLabels()
    }
    
    // set congrats labels
    func setLabels(){
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineBreakMode = .byWordWrapping
        
        let congratsString = NSMutableAttributedString(string: "Congratulations! 🎉", attributes: [NSMutableAttributedString.Key.font : UIFont.systemFont(ofSize: 30, weight: .heavy)])
        let greatString = NSMutableAttributedString(string: "You have learned about my shapes and solved a true challenge. Very good! 👏🏻", attributes: [NSMutableAttributedString.Key.font : UIFont.systemFont(ofSize: 25, weight: .ultraLight), NSMutableAttributedString.Key.paragraphStyle: paragraphStyle])
        
        self.congratsLabel.attributedText = congratsString
        self.congratsLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 130)
        self.addChild(congratsLabel)
        
        self.greatLabel.attributedText = greatString
        self.greatLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 50)
        self.greatLabel.numberOfLines = 2
        self.greatLabel.preferredMaxLayoutWidth = 480
        self.addChild(greatLabel)
    }
    
    // set button to restart game
    func createRestartButton(){
        
        let restartButtonString = NSMutableAttributedString(string: "Wanna play again?", attributes: [NSMutableAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .heavy), .foregroundColor : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
        self.restartButton.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 400, height: 35), cornerRadius: 20).cgPath
        self.restartButton.position = CGPoint(x:self.frame.midX - 200, y:self.frame.midY - 210)
        self.restartButton.fillColor = #colorLiteral(red: 0.5176470588, green: 0.6470588235, blue: 0.6156862745, alpha: 1)
        self.restartButton.lineWidth = 1
        self.restartButton.strokeColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        self.restartButtonLabel.attributedText = restartButtonString
        self.restartButtonLabel.position = CGPoint(x: restartButton.frame.midX, y: restartButton.frame.midY-8)
        
        self.addChild(restartButton)
        self.addChild(restartButtonLabel)
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        if restartButton.contains(touchLocation) {
            let sceneMoveTo = HelloScene(size: self.size)
            sceneMoveTo.scaleMode = self.scaleMode
            
            let transition = SKTransition.moveIn(with: .up, duration: 0.3)
            self.scene?.view?.presentScene(sceneMoveTo ,transition: transition)
        }
    }
}

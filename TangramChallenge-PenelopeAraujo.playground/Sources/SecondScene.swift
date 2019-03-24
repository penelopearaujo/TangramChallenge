import Foundation
import SpriteKit

public class SecondScene: SKScene{
    
    let funLabel = SKLabelNode()
    let aboutLabel = SKLabelNode()
    let hintLabel = SKLabelNode()
    
    let triangleImage = SKSpriteNode(imageNamed: "triangle")
    let squareImage = SKSpriteNode(imageNamed: "square")
    let parallelogramImage = SKSpriteNode(imageNamed: "parallelogram")
    
    let triangleLabel = SKLabelNode()
    let squareLabel = SKLabelNode()
    let parallelogramLabel = SKLabelNode()
    
    let triangleBlank = SKShapeNode()
    let squareBlank = SKShapeNode()
    let parallelogramBlank = SKShapeNode()
    
    // used for making objects draggable
    private var currentNode: SKNode?
    
    
    override public func didMove(to view: SKView) {
        
        self.backgroundColor = #colorLiteral(red: 0.9882352941, green: 1, blue: 0.9176470588, alpha: 1)
        
        self.setLabels()
        self.setPiecesImages()
        self.setBlanks()
        
    }
    
    // set labels with instructions
    func setLabels(){
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineBreakMode = .byWordWrapping
        
        let funString = NSMutableAttributedString(string: "My shapes!", attributes: [NSMutableAttributedString.Key.font : UIFont.systemFont(ofSize: 25, weight: .heavy)])
        self.funLabel.attributedText = funString
        self.funLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 180)
        self.addChild(funLabel)
        
        let aboutString = NSMutableAttributedString(string: "I have 7 pieces and they are called tans. My tans have 3 basic shapes: triangles, parallelograms and squares. The triangles have 3 sides, the squares have 4 equal sides and the parallelograms have two pairs of parallel sides. Do you know which shapes are those?", attributes: [NSMutableAttributedString.Key.font : UIFont.systemFont(ofSize: 22, weight: .ultraLight), NSMutableAttributedString.Key.paragraphStyle: paragraphStyle])
        self.aboutLabel.attributedText = aboutString
        self.aboutLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 30)
        self.aboutLabel.numberOfLines = 5
        self.aboutLabel.preferredMaxLayoutWidth = 480
        self.addChild(aboutLabel)
        
        let hintString = NSMutableAttributedString(string: "Hint: drag the names and drop them in the correct place!", attributes: [NSMutableAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .ultraLight)])
        self.hintLabel.attributedText = hintString
        self.hintLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(hintLabel)
        
        let shapeLabelAttributes = [NSMutableAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .regular)]
        
        let triangleString = NSMutableAttributedString(string: "triangle", attributes: shapeLabelAttributes)
        let squareString = NSMutableAttributedString(string: "square", attributes: shapeLabelAttributes)
        let parallelogramString = NSMutableAttributedString(string: "parallelogram", attributes: shapeLabelAttributes)
        
        self.triangleLabel.attributedText = triangleString
        self.triangleLabel.position = CGPoint(x:self.frame.midX + 150, y:self.frame.midY - 180)
        self.triangleLabel.name = "triangleDraggable"
        self.triangleLabel.zPosition = 1
        self.addChild(triangleLabel)
        
        self.squareLabel.attributedText = squareString
        self.squareLabel.position = CGPoint(x:self.frame.midX - 150, y:self.frame.midY - 180)
        self.squareLabel.name = "squareDraggable"
        self.squareLabel.zPosition = 1
        self.addChild(squareLabel)
        
        self.parallelogramLabel.attributedText = parallelogramString
        self.parallelogramLabel.position = CGPoint(x:self.frame.midX, y:self.frame.midY - 180)
        self.parallelogramLabel.name = "parallelogramDraggable"
        self.parallelogramLabel.zPosition = 1
        self.addChild(parallelogramLabel)
        
    }
    
    // set spaces for filling with shape labels
    func setBlanks(){
        
        self.triangleBlank.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 130, height: 25), cornerRadius: 20).cgPath
        self.triangleBlank.position = CGPoint(x:self.frame.midX - 220, y:self.frame.midY - 140)
        self.triangleBlank.fillColor = #colorLiteral(red: 0.8680491849, green: 0.9294117647, blue: 0.9224959368, alpha: 1)
        self.triangleBlank.lineWidth = 1
        self.triangleBlank.strokeColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.addChild(triangleBlank)
        
        self.squareBlank.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 130, height: 25), cornerRadius: 20).cgPath
        self.squareBlank.position = CGPoint(x:self.frame.midX - 60, y:self.frame.midY - 140)
        self.squareBlank.fillColor = #colorLiteral(red: 0.8980392157, green: 0.6745098039, blue: 0.6745098039, alpha: 1)
        self.squareBlank.lineWidth = 1
        self.squareBlank.strokeColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.addChild(squareBlank)
        
        self.parallelogramBlank.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 130, height: 25), cornerRadius: 20).cgPath
        self.parallelogramBlank.position = CGPoint(x:self.frame.midX + 100, y:self.frame.midY - 140)
        self.parallelogramBlank.fillColor = #colorLiteral(red: 0.9764705882, green: 0.8156862745, blue: 0.5294117647, alpha: 1)
        self.parallelogramBlank.lineWidth = 1
        self.parallelogramBlank.strokeColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.addChild(parallelogramBlank)
        
    }
    
    // set tangram pieces images on screen
    func setPiecesImages(){
        self.triangleImage.position = CGPoint(x:self.frame.midX - 150, y:self.frame.midY - 60)
        self.addChild(triangleImage)
        
        self.squareImage.position = CGPoint(x:self.frame.midX, y:self.frame.midY - 60)
        self.addChild(squareImage)
        
        self.parallelogramImage.position = CGPoint(x: self.frame.midX + 150, y: self.frame.midY - 60)
        self.addChild(parallelogramImage)
    }
    

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            let location = touch.location(in: self)
            
            let touchedNodes = self.nodes(at: location)
            for node in touchedNodes.reversed() {
                if node.name == "triangleDraggable" || node.name == "squareDraggable" || node.name == "parallelogramDraggable" {
                    self.currentNode = node
                }
            }
        }
    }
    
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first, let node = self.currentNode {
            let touchLocation = touch.location(in: self)
            node.position = touchLocation
        }

    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.currentNode = nil
        var correctAnswers = false
        
        if triangleBlank.frame.contains(self.triangleLabel.position) == false {
            // put label back in original place
            triangleLabel.position = CGPoint(x:self.frame.midX + 150, y:self.frame.midY - 180)
  
            // shake label (wrong answer)
            let leftPosition = SKAction.moveTo(x: self.triangleLabel.position.x-7, duration: 0.03)
            let rightPosition = SKAction.moveTo(x: self.triangleLabel.position.x+7, duration: 0.03)
            let centerPosition = SKAction.moveTo(x: self.triangleLabel.position.x, duration: 0.03)
            
            let sequence = SKAction.sequence([leftPosition,rightPosition,centerPosition])
            self.triangleLabel.run(.repeat(sequence, count: 5))
            
        }
        
        if squareBlank.frame.contains(self.squareLabel.position) == false {
            
            // put label back in original place
            squareLabel.position = CGPoint(x:self.frame.midX - 150, y:self.frame.midY - 180)
            
            // shake label (wrong answer)
            let leftPosition = SKAction.moveTo(x: self.squareLabel.position.x-7, duration: 0.03)
            let rightPosition = SKAction.moveTo(x: self.squareLabel.position.x+7, duration: 0.03)
            let centerPosition = SKAction.moveTo(x: self.squareLabel.position.x, duration: 0.03)
            
            let sequence = SKAction.sequence([leftPosition,rightPosition,centerPosition])
            self.squareLabel.run(.repeat(sequence, count: 5))
            
        }
        
        if parallelogramBlank.frame.contains(self.parallelogramLabel.position) == false {
            
            // put label back in original place
            parallelogramLabel.position = CGPoint(x:self.frame.midX, y:self.frame.midY - 180)
           
            // shake label (wrong answer)
            let leftPosition = SKAction.moveTo(x: self.parallelogramLabel.position.x-7, duration: 0.03)
            let rightPosition = SKAction.moveTo(x: self.parallelogramLabel.position.x+7, duration: 0.03)
            let centerPosition = SKAction.moveTo(x: self.parallelogramLabel.position.x, duration: 0.03)
            
            let sequence = SKAction.sequence([leftPosition,rightPosition,centerPosition])
            self.parallelogramLabel.run(.repeat(sequence, count: 5))
        }
        
        // all answers are correct: next scene
        if triangleBlank.frame.contains(self.triangleLabel.position) && squareBlank.frame.contains(self.squareLabel.position) && parallelogramBlank.frame.contains(self.parallelogramLabel.position) {
            correctAnswers = true
            print(correctAnswers)
            
            // set button to next scene
            let nextButton = SKShapeNode()
            let nextButtonLabel = SKLabelNode()
            let nextButtonString = NSMutableAttributedString(string: "Great! Now let's solve a challenge!", attributes: [NSMutableAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .heavy), .foregroundColor : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])

            nextButton.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 400, height: 35), cornerRadius: 20).cgPath
            nextButton.position = CGPoint(x:self.frame.midX - 200, y:self.frame.midY - 210)
            nextButton.fillColor = #colorLiteral(red: 0.5176470588, green: 0.6470588235, blue: 0.6156862745, alpha: 1)
            nextButton.lineWidth = 1
            nextButton.strokeColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            
            nextButtonLabel.attributedText = nextButtonString
            nextButtonLabel.position = CGPoint(x: nextButton.frame.midX, y: nextButton.frame.midY-8)
            
            self.addChild(nextButton)
            self.addChild(nextButtonLabel)
            
            // go to new scene
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            
            if nextButton.contains(touchLocation) {
                let sceneMoveTo = ThirdScene(size: self.size)
                sceneMoveTo.scaleMode = self.scaleMode
                
                let transition = SKTransition.moveIn(with: .up, duration: 0.2)
                self.scene?.view?.presentScene(sceneMoveTo ,transition: transition)
                
            }
        }
    }
}

import Foundation
import SpriteKit

public class SecondScene: SKScene{
    
    let funLabel = SKLabelNode(text: "Fun fact about me:")
    let aboutLabel = SKLabelNode(text: "I have 7 pieces and they are called tans.")
    let aboutShapesLabel = SKLabelNode(text: "My tans have 3 basic shapes:")
    let theShapesLabel = SKLabelNode(text: "triangles, squares and parallelograms.")
    let helpLabel = SKLabelNode(text: "Do you know which shapes are those?")
    let hintLabel = SKLabelNode(text: "Hint: you can drag and drop.")
    
    let triangleImage = SKSpriteNode(imageNamed: "triangle")
    let squareImage = SKSpriteNode(imageNamed: "square")
    let parallelogramImage = SKSpriteNode(imageNamed: "parallelogram")
    
    let triangleLabel = SKLabelNode(text: "triangle")
    let squareLabel = SKLabelNode(text: "square")
    let parallelogramLabel = SKLabelNode(text: "parallelogram")
    
    let triangleBlank = SKShapeNode()
    let squareBlank = SKShapeNode()
    let parallelogramBlank = SKShapeNode()
    
    // used for making objects draggable
    private var currentNode: SKNode?
    
    
    override public func didMove(to view: SKView) {
        
        let frame = CGRect(x: 0, y: 0, width: 600, height: 500)
        self.backgroundColor = #colorLiteral(red: 0.9882352941, green: 1, blue: 0.9176470588, alpha: 1)
        
        self.setLabels()
        self.setPiecesImages()
        self.setBlanks()
        
    }
    
    // set spaces for filling with shape labels
    func setBlanks(){
        
        self.triangleBlank.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 130, height: 25), cornerRadius: 20).cgPath
        self.triangleBlank.position = CGPoint(x:self.frame.midX - 220, y:self.frame.midY - 140)
        self.triangleBlank.fillColor = #colorLiteral(red: 0.8745098039, green: 0.9254901961, blue: 0.9294117647, alpha: 1)
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
    
    // set labels with instructions
    func setLabels(){
        
        self.funLabel.fontColor = #colorLiteral(red: 0.07058823529, green: 0.0431372549, blue: 0.0431372549, alpha: 1)
        self.funLabel.fontName = ".SFUIText"
        self.funLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 180)
        self.funLabel.fontSize = 25
        self.addChild(funLabel)
        
        self.aboutLabel.fontColor = #colorLiteral(red: 0.07058823529, green: 0.0431372549, blue: 0.0431372549, alpha: 1)
        self.aboutLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 150)
        self.aboutLabel.fontSize = 25
        self.addChild(aboutLabel)
        
        self.aboutShapesLabel.fontColor = #colorLiteral(red: 0.07058823529, green: 0.0431372549, blue: 0.0431372549, alpha: 1)
        self.aboutShapesLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 120)
        self.aboutShapesLabel.fontSize = 25
        self.addChild(aboutShapesLabel)
        
        self.theShapesLabel.fontColor = #colorLiteral(red: 0.07058823529, green: 0.0431372549, blue: 0.0431372549, alpha: 1)
        self.theShapesLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 90)
        self.theShapesLabel.fontSize = 25
        self.addChild(theShapesLabel)
        
        self.helpLabel.fontColor = #colorLiteral(red: 0.07058823529, green: 0.0431372549, blue: 0.0431372549, alpha: 1)
        self.helpLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 60)
        self.helpLabel.fontSize = 25
        self.addChild(helpLabel)
        
        self.hintLabel.fontColor = #colorLiteral(red: 0.07058823529, green: 0.0431372549, blue: 0.0431372549, alpha: 1)
        self.hintLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 30)
        self.hintLabel.fontSize = 18
        self.addChild(hintLabel)
        
        self.triangleLabel.fontColor = #colorLiteral(red: 0.07058823529, green: 0.0431372549, blue: 0.0431372549, alpha: 1)
        self.triangleLabel.position = CGPoint(x:self.frame.midX + 150, y:self.frame.midY - 180)
        self.triangleLabel.fontName = ".SFUIText"
        self.triangleLabel.fontSize = 18
        self.triangleLabel.name = "triangleDraggable"
        self.triangleLabel.zPosition = 1
        self.addChild(triangleLabel)
        
        self.squareLabel.fontColor = #colorLiteral(red: 0.07058823529, green: 0.0431372549, blue: 0.0431372549, alpha: 1)
        self.squareLabel.position = CGPoint(x:self.frame.midX - 150, y:self.frame.midY - 180)
        self.squareLabel.fontName = ".SFUIText"
        self.squareLabel.fontSize = 18
        self.squareLabel.name = "squareDraggable"
        self.squareLabel.zPosition = 1
        self.addChild(squareLabel)
        
        self.parallelogramLabel.fontColor = #colorLiteral(red: 0.07058823529, green: 0.0431372549, blue: 0.0431372549, alpha: 1)
        self.parallelogramLabel.position = CGPoint(x:self.frame.midX, y:self.frame.midY - 180)
        self.parallelogramLabel.fontName = ".SFUIText"
        self.parallelogramLabel.fontSize = 18
        self.parallelogramLabel.name = "parallelogramDraggable"
        self.parallelogramLabel.zPosition = 1
        self.addChild(parallelogramLabel)
        
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

            nextButton.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 400, height: 35), cornerRadius: 20).cgPath
            nextButton.position = CGPoint(x:self.frame.midX - 200, y:self.frame.midY - 210)
            nextButton.fillColor = #colorLiteral(red: 0.5176470588, green: 0.6470588235, blue: 0.6156862745, alpha: 1)
            nextButton.lineWidth = 1
            nextButton.strokeColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            
            nextButtonLabel.text = "Great! Now let's solve some challenges!"
            nextButtonLabel.fontSize = 18
            nextButtonLabel.fontName = ".SFUIText"
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

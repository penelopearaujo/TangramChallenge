import Foundation
import SpriteKit
import UIKit

// tangram draggable piece
struct Piece {
    var name: String
    var shape: SKSpriteNode
    var angle: CGFloat
    var originalPosition: CGPoint
}

// tangram challenge piece
struct ChallengePiece {
    var name: String
    var shape: SKSpriteNode
    var maxXPosition: Float
    var minXPosition: Float
    var maxYPosition: Float
    var minYPosition: Float
    var position: CGPoint
    var angle: CGFloat
}

// identifier for using the piece on screen
enum PieceIdentifier: String, CaseIterable {
    case triangle1 = "triangle1"
    case triangle2 = "triangle2"
    case triangle3 = "triangle3"
    case triangle4 = "triangle4"
    case triangle5 = "triangle5"
    case square = "square"
    case parallelogram = "parallelogram"
}

public class ThirdScene: SKScene {
    
    // create buttons for ending the game
    let endButton = SKShapeNode()
    let endButtonLabel = SKLabelNode()
    
    // create labels for instructions
    let challengeLabel = SKLabelNode()
    let instructionsLabel = SKLabelNode()
    let hintLabel = SKLabelNode()
    
    // create parts of tangram pieces
    var bigTri1Path = UIBezierPath()
    var bigTri1Shape = SKShapeNode()
    var bigTri1 = SKSpriteNode()
    
    var bigTri2Path = UIBezierPath()
    var bigTri2Shape = SKShapeNode()
    var bigTri2 = SKSpriteNode()
    
    var smallTri1Path = UIBezierPath()
    var smallTri1Shape = SKShapeNode()
    var smallTri1 = SKSpriteNode()
    
    var smallTri2Path = UIBezierPath()
    var smallTri2Shape = SKShapeNode()
    var smallTri2 = SKSpriteNode()
    
    var squarePath = UIBezierPath()
    var squareShape = SKShapeNode()
    var squareSK = SKSpriteNode()
    
    var mediumTriPath = UIBezierPath()
    var mediumTriShape = SKShapeNode()
    var mediumTri = SKSpriteNode()
    
    var parallelPath = UIBezierPath()
    var parallelShape = SKShapeNode()
    var parallel = SKSpriteNode()
    
    // MARK: Create entire tangram pieces
    var bigTriangle1 = Piece(name: PieceIdentifier.triangle1.rawValue, shape: SKSpriteNode(), angle: 0, originalPosition: CGPoint(x: 70, y: 120))
    var bigTriangle2 = Piece(name: PieceIdentifier.triangle2.rawValue, shape: SKSpriteNode(), angle: 0, originalPosition: CGPoint(x: 120, y: 170))
    var smallTriangle1 = Piece(name: PieceIdentifier.triangle3.rawValue, shape: SKSpriteNode(), angle: 0, originalPosition: CGPoint(x: 70, y: 45))
    var smallTriangle2 = Piece(name: PieceIdentifier.triangle4.rawValue, shape: SKSpriteNode(), angle: 0, originalPosition: CGPoint(x: 145, y: 120))
    var mediumTriangle = Piece(name: PieceIdentifier.triangle5.rawValue, shape: SKSpriteNode(), angle: 0, originalPosition: CGPoint(x: 200, y: 40))
    var square = Piece(name: PieceIdentifier.square.rawValue, shape: SKSpriteNode(), angle: 0, originalPosition: CGPoint(x: 120, y: 70))
    var parallelogram = Piece(name: PieceIdentifier.parallelogram.rawValue, shape: SKSpriteNode(), angle: 0, originalPosition: CGPoint(x: 195, y: 145))
    
    // MARK: Create challenge pieces
    var challengeBigTriangle1 = ChallengePiece(name: "triangle1Challenge", shape: SKSpriteNode(), maxXPosition: 465, minXPosition: 445, maxYPosition: 185, minYPosition: 165, position: CGPoint(x: 455, y: 175), angle: 0)
    var challengeBigTriangle2 = ChallengePiece(name: "triangle2Challenge", shape: SKSpriteNode(), maxXPosition: 465, minXPosition: 445, maxYPosition: 283, minYPosition: 263, position: CGPoint(x: 455, y: 273), angle: 4.71238899230957)
    var challengeSmallTriangle1 = ChallengePiece(name: "triangle3Challenge", shape: SKSpriteNode(), maxXPosition: 460, minXPosition: 440, maxYPosition: 85, minYPosition: 65, position: CGPoint(x: 530, y: 75), angle: 1.5707963705062866)
    var challengeSmallTriangle2 = ChallengePiece(name: "triangle4Challenge", shape: SKSpriteNode(), maxXPosition: 465, minXPosition: 445, maxYPosition: 409, minYPosition: 389, position: CGPoint(x: 455, y: 399), angle: 4.71238899230957)
    var challengeMediumTriangle = ChallengePiece(name: "triangle5Challenge", shape: SKSpriteNode(), maxXPosition: 465, minXPosition: 445, maxYPosition: 334, minYPosition: 314, position: CGPoint(x: 485, y: 294), angle: 3.1415927410125732)
    var challengeSquare = ChallengePiece(name: "squareChallenge", shape: SKSpriteNode(), maxXPosition: 515, minXPosition: 495, maxYPosition: 135, minYPosition: 115, position: CGPoint(x: 505, y: 125), angle: 0)
    var challengeParallelogram = ChallengePiece(name: "parallelogramChallenge", shape: SKSpriteNode(), maxXPosition: 390, minXPosition: 370, maxYPosition: 110, minYPosition: 90, position: CGPoint(x: 380, y: 100), angle: 0)
    
    var allTangramPieces: [Piece] = []
    
    // used for turn static objects into draggable objects
    private var currentNode: SKNode?
    
    // MARK: Basic scence settings
    override public func didMove(to view: SKView) {
        
        self.backgroundColor = #colorLiteral(red: 0.9882352941, green: 1, blue: 0.9176470588, alpha: 1)
        
        self.setChallenge()
        self.setTangram()
        self.setInstructions()
        
        allTangramPieces = [bigTriangle1, bigTriangle2, smallTriangle1, smallTriangle2, mediumTriangle, square, parallelogram]
        
        // recognize if user double tapped the piece
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTapsRequired = 2
        view.addGestureRecognizer(tap)
    }
    
    // MARK: Set instructions
    func setInstructions() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        paragraphStyle.lineBreakMode = .byWordWrapping
        
        let challengeString = NSMutableAttributedString(string: "My challenge!", attributes: [NSMutableAttributedString.Key.font : UIFont.systemFont(ofSize: 25, weight: .heavy)])
        self.challengeLabel.attributedText = challengeString
        self.challengeLabel.position = CGPoint(x: self.frame.minX + 165, y: self.frame.midY + 180)
        self.addChild(challengeLabel)
        
        let instructionsString = NSMutableAttributedString(string: "The best thing about me is that my tans can be moved around to create new shapes! Let's try to build this rocket? 🚀", attributes: [NSMutableAttributedString.Key.font : UIFont.systemFont(ofSize: 22, weight: .ultraLight), NSMutableAttributedString.Key.paragraphStyle: paragraphStyle])
        self.instructionsLabel.attributedText = instructionsString
        self.instructionsLabel.position = CGPoint(x: self.frame.minX + 170, y: self.frame.midY + 55)
        self.instructionsLabel.numberOfLines = 5
        self.instructionsLabel.preferredMaxLayoutWidth = 300
        self.addChild(instructionsLabel)
        
        let hintString = NSMutableAttributedString(string: "Hint: drag and drop the pieces in the right place. Double tap to rotate the selected piece!", attributes: [NSMutableAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .ultraLight)])
        self.hintLabel.attributedText = hintString
        self.hintLabel.position = CGPoint(x: self.frame.minX + 168, y: self.frame.midY - 15)
        self.hintLabel.numberOfLines = 3
        self.hintLabel.preferredMaxLayoutWidth = 300
        self.addChild(hintLabel)
        
    }
    
    // MARK: Rotate piece function
    @objc func doubleTapped() {
        let rotate = SKAction.rotate(byAngle: CGFloat.pi/2, duration: 0)
        if let node = self.currentNode {
            node.run(rotate) {
                print("zRot: \(node.zRotation)")
                
                for var piece in self.allTangramPieces {
                    if piece.name == node.name {
                        piece.angle = node.zRotation
                    }
                }
            }
        }
    }
    
    // Set button to the end
    func setEndButton(){
        let endButtonString = NSMutableAttributedString(string: "Ok! Finished it! 🎉", attributes: [NSMutableAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .heavy), .foregroundColor : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
        
        self.endButton.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 200, height: 35), cornerRadius: 20).cgPath
        self.endButton.fillColor = #colorLiteral(red: 0.5176470588, green: 0.6470588235, blue: 0.6156862745, alpha: 1)
        self.endButton.lineWidth = 1
        self.endButton.strokeColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.endButton.position = CGPoint(x:self.frame.minX + 60, y:self.frame.midY)

        self.endButtonLabel.attributedText = endButtonString
        self.endButtonLabel.position = CGPoint(x: endButton.frame.midX, y: endButton.frame.midY-8)
        
        self.addChild(endButton)
        self.addChild(endButtonLabel)
    }
    
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // recognize if touched object is a tangram piece
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchedNodes = self.nodes(at: location)
            for node in touchedNodes {
                if let name = node.name {
                    if let identifier = PieceIdentifier(rawValue: name) {
                        if PieceIdentifier.allCases.contains(identifier) {
                            self.currentNode = node
                        }
                    }
                }
            }
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // drag the piece
        if let touch = touches.first, let node = self.currentNode {
            let touchLocation = touch.location(in: self)
            node.position = touchLocation
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let node = self.currentNode else {
            return
        }
        
        // MARK: Put piece back in place if its moved to outside the view
        let currentPosition = node.position
        if currentPosition.x >= 600 || currentPosition.y >= 500 || currentPosition.x < 0 || currentPosition.y < 0 {
            for piece in self.allTangramPieces {
                if piece.name == node.name {
                    let moveBack = SKAction.move(to: piece.originalPosition, duration: 0.3)
                    node.run(moveBack)
                }
            }
        }
        
        // MARK: Check if piece is in the right angle to fit the challenge
        let identifier: PieceIdentifier = PieceIdentifier(rawValue: self.currentNode!.name!)!
        var isInTheRightAngle: Bool = false
        
        switch identifier {
        case .triangle1:
            isInTheRightAngle = (self.currentNode!.zRotation == 0 ||
                (abs(round(self.currentNode!.zRotation/(CGFloat.pi * 2)) - self.currentNode!.zRotation/(CGFloat.pi * 2))) < 0.02)
        case .triangle2:
            isInTheRightAngle = (self.currentNode!.zRotation != 0 && (abs(round(self.currentNode!.zRotation/(CGFloat.pi * 3/4)) - self.currentNode!.zRotation/(CGFloat.pi * 3/4))) < 0.02)
        case .triangle3:
            isInTheRightAngle = (self.currentNode!.zRotation != 0  && (abs(round(self.currentNode!.zRotation.truncatingRemainder(dividingBy: CGFloat.pi / 2)))) < 0.02)
        case .triangle4:
            isInTheRightAngle = (self.currentNode!.zRotation != 0 && (abs(round(self.currentNode!.zRotation/(CGFloat.pi * 3/4)) - self.currentNode!.zRotation/(CGFloat.pi * 3/4))) < 0.02)
        case .triangle5:
            isInTheRightAngle = (self.currentNode!.zRotation != 0)
        case .square:
            isInTheRightAngle = true
        case .parallelogram:
            isInTheRightAngle = (self.currentNode!.zRotation == 0 ||
                (abs(round(self.currentNode!.zRotation/(CGFloat.pi * 2)) - self.currentNode!.zRotation/(CGFloat.pi * 2))) < 0.02)
        default:
            isInTheRightAngle = false
        }
        
        print("id \(identifier) is \(isInTheRightAngle)")

        var piecesInRightPlace = 0

        // MARK: Put the piece in the right place if its nearby
        if isInTheRightAngle {
            if (challengeBigTriangle1.minXPosition)...(challengeBigTriangle1.maxXPosition) ~= Float(bigTriangle1.shape.position.x) || (challengeBigTriangle1.minYPosition)...(challengeBigTriangle1.maxYPosition) ~= Float(bigTriangle1.shape.position.y){
                bigTriangle1.shape.position = challengeBigTriangle1.position
                piecesInRightPlace += 1
            }
            
            if (challengeBigTriangle2.minXPosition)...(challengeBigTriangle2.maxXPosition) ~= Float(bigTriangle2.shape.position.x) || (challengeBigTriangle2.minYPosition)...(challengeBigTriangle2.maxYPosition) ~= Float(bigTriangle2.shape.position.y) {
                bigTriangle2.shape.position = challengeBigTriangle2.position
                piecesInRightPlace += 1
                
            }
            
            if (challengeParallelogram.minXPosition)...(challengeParallelogram.maxXPosition) ~= Float(parallelogram.shape.position.x) || (challengeParallelogram.minYPosition)...(challengeParallelogram.maxYPosition) ~= Float(parallelogram.shape.position.y) {
                parallelogram.shape.position = challengeParallelogram.position
                piecesInRightPlace += 1
                
            }
            
            if (challengeSquare.minXPosition)...(challengeSquare.maxXPosition) ~= Float(square.shape.position.x) || (challengeSquare.minYPosition)...(challengeSquare.maxYPosition) ~= Float(square.shape.position.y) {
                square.shape.position = challengeSquare.position
                piecesInRightPlace += 1
                
            }
            
            if (challengeSmallTriangle1.minXPosition)...(challengeSmallTriangle1.maxXPosition) ~= Float(smallTriangle1.shape.position.x) || (challengeSmallTriangle1.minYPosition)...(challengeSmallTriangle1.maxYPosition) ~= Float(smallTriangle1.shape.position.y) {
                smallTriangle1.shape.position = challengeSmallTriangle1.position
                piecesInRightPlace += 1
                
            }
            
            if (challengeSmallTriangle2.minXPosition)...(challengeSmallTriangle2.maxXPosition) ~= Float(smallTriangle2.shape.position.x) || (challengeSmallTriangle2.minYPosition)...(challengeSmallTriangle2.maxYPosition) ~= Float(smallTriangle2.shape.position.y) {
                smallTriangle2.shape.position = challengeSmallTriangle2.position
                piecesInRightPlace += 1
                
            }
            
            if (challengeMediumTriangle.minXPosition)...(challengeMediumTriangle.maxXPosition) ~= Float(mediumTriangle.shape.position.x) || (challengeMediumTriangle.minYPosition)...(challengeMediumTriangle.maxYPosition) ~= Float(mediumTriangle.shape.position.y) {
                mediumTriangle.shape.position.x = challengeMediumTriangle.position.x
                mediumTriangle.shape.position.y = challengeMediumTriangle.position.y
                piecesInRightPlace += 1
                
            }
        }
        
        if piecesInRightPlace >= 6 {
//            self.hintLabel.removeFromParent()
//            self.setEndButton()
            let sceneMoveTo = EndScene(size: self.size)
            sceneMoveTo.scaleMode = self.scaleMode
            
            let transition = SKTransition.fade(withDuration: 1)
//            let transition = SKTransition.moveIn(with: .up, duration: 1)
            self.scene?.view?.presentScene(sceneMoveTo ,transition: transition)
        }
        
        self.currentNode = nil
    }
}

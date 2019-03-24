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
    var bigTriangle1 = Piece(name: PieceIdentifier.triangle1.rawValue, shape: SKSpriteNode(), angle: 0, originalPosition: CGPoint(x: 50, y: 100))
    var bigTriangle2 = Piece(name: PieceIdentifier.triangle2.rawValue, shape: SKSpriteNode(), angle: 0, originalPosition: CGPoint(x: 100, y: 150))
    var smallTriangle1 = Piece(name: PieceIdentifier.triangle3.rawValue, shape: SKSpriteNode(), angle: 0, originalPosition: CGPoint(x: 50, y: 25))
    var smallTriangle2 = Piece(name: PieceIdentifier.triangle4.rawValue, shape: SKSpriteNode(), angle: 0, originalPosition: CGPoint(x: 125, y: 100))
    var mediumTriangle = Piece(name: PieceIdentifier.triangle5.rawValue, shape: SKSpriteNode(), angle: 0, originalPosition: CGPoint(x: 100, y: 50))
    var square = Piece(name: PieceIdentifier.square.rawValue, shape: SKSpriteNode(), angle: 0, originalPosition: CGPoint(x: 100, y: 50))
    var parallelogram = Piece(name: PieceIdentifier.parallelogram.rawValue, shape: SKSpriteNode(), angle: 0, originalPosition: CGPoint(x: 175, y: 125))
    
    // MARK: Create challenge pieces
    var challengeBigTriangle1 = ChallengePiece(name: "triangle1Challenge", shape: SKSpriteNode(), maxXPosition: 385, minXPosition: 365, maxYPosition: 185, minYPosition: 165, position: CGPoint(x: 375, y: 175), angle: 0)
    var challengeBigTriangle2 = ChallengePiece(name: "triangle2Challenge", shape: SKSpriteNode(), maxXPosition: 385, minXPosition: 365, maxYPosition: 283, minYPosition: 263, position: CGPoint(x: 375, y: 273), angle: 4.71238899230957)
    var challengeSmallTriangle1 = ChallengePiece(name: "triangle3Challenge", shape: SKSpriteNode(), maxXPosition: 460, minXPosition: 440, maxYPosition: 85, minYPosition: 65, position: CGPoint(x: 450, y: 75), angle: 1.5707963705062866)
    var challengeSmallTriangle2 = ChallengePiece(name: "triangle4Challenge", shape: SKSpriteNode(), maxXPosition: 385, minXPosition: 365, maxYPosition: 410, minYPosition: 390, position: CGPoint(x: 375, y: 400), angle: 4.71238899230957)
    var challengeMediumTriangle = ChallengePiece(name: "triangle5Challenge", shape: SKSpriteNode(), maxXPosition: 385, minXPosition: 365, maxYPosition: 409, minYPosition: 389, position: CGPoint(x: 375, y: 399), angle: 3.1415927410125732)
    var challengeSquare = ChallengePiece(name: "squareChallenge", shape: SKSpriteNode(), maxXPosition: 435, minXPosition: 415, maxYPosition: 135, minYPosition: 115, position: CGPoint(x: 425, y: 125), angle: 0)
    var challengeParallelogram = ChallengePiece(name: "parallelogramChallenge", shape: SKSpriteNode(), maxXPosition: 310, minXPosition: 290, maxYPosition: 110, minYPosition: 90, position: CGPoint(x: 300, y: 100), angle: 0)
    
    var allTangramPieces: [Piece] = []
    
    // used for turn static objects into draggable objects
    private var currentNode: SKNode?
    
    // MARK: Basic scence settings
    override public func didMove(to view: SKView) {
        
        let frame = CGRect(x: 0, y: 0, width: 600, height: 500)
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
        
        // put piece back in place if its moved to outside the view
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
        // AJEITAR ESSE CASO
        case .parallelogram:
            isInTheRightAngle = (self.currentNode!.zRotation == 0 ||
                (abs(round(self.currentNode!.zRotation/(CGFloat.pi * 2)) - self.currentNode!.zRotation/(CGFloat.pi * 2))) < 0.02)
        default:
            isInTheRightAngle = false
        }
        
        print("id \(identifier) is \(isInTheRightAngle)")
        
        if isInTheRightAngle {
            if (challengeBigTriangle1.minXPosition)...(challengeBigTriangle1.maxXPosition) ~= Float(bigTriangle1.shape.position.x) || (challengeBigTriangle1.minYPosition)...(challengeBigTriangle1.maxYPosition) ~= Float(bigTriangle1.shape.position.y){
                bigTriangle1.shape.position = challengeBigTriangle1.position
                // animar enquanto ele muda de posição
                
            }
            
            if (challengeBigTriangle2.minXPosition)...(challengeBigTriangle2.maxXPosition) ~= Float(bigTriangle2.shape.position.x) || (challengeBigTriangle2.minYPosition)...(challengeBigTriangle2.maxYPosition) ~= Float(bigTriangle2.shape.position.y) {
                bigTriangle2.shape.position = challengeBigTriangle2.position
                // animar enquanto ele muda de posição
            }
            
            if (challengeParallelogram.minXPosition)...(challengeParallelogram.maxXPosition) ~= Float(parallelogram.shape.position.x) || (challengeParallelogram.minYPosition)...(challengeParallelogram.maxYPosition) ~= Float(parallelogram.shape.position.y) {
                parallelogram.shape.position = challengeParallelogram.position
                // animar enquanto ele muda de posição
            }
            
            if (challengeSquare.minXPosition)...(challengeSquare.maxXPosition) ~= Float(square.shape.position.x) || (challengeSquare.minYPosition)...(challengeSquare.maxYPosition) ~= Float(square.shape.position.y) {
                square.shape.position = challengeSquare.position
                // animar enquanto ele muda de posição
            }
            
            if (challengeSmallTriangle1.minXPosition)...(challengeSmallTriangle1.maxXPosition) ~= Float(smallTriangle1.shape.position.x) || (challengeSmallTriangle1.minYPosition)...(challengeSmallTriangle1.maxYPosition) ~= Float(smallTriangle1.shape.position.y) {
                smallTriangle1.shape.position = challengeSmallTriangle1.position
                // animar enquanto ele muda de posição
            }
            
            if (challengeSmallTriangle2.minXPosition)...(challengeSmallTriangle2.maxXPosition) ~= Float(smallTriangle2.shape.position.x) || (challengeSmallTriangle2.minYPosition)...(challengeSmallTriangle2.maxYPosition) ~= Float(smallTriangle2.shape.position.y) {
                smallTriangle2.shape.position = challengeSmallTriangle2.position
                // animar enquanto ele muda de posição
            }
            
            if (challengeMediumTriangle.minXPosition)...(challengeMediumTriangle.maxXPosition) ~= Float(mediumTriangle.shape.position.x) || (challengeMediumTriangle.minYPosition)...(challengeMediumTriangle.maxYPosition) ~= Float(mediumTriangle.shape.position.y) {
                mediumTriangle.shape.position.x = challengeMediumTriangle.position.x
                mediumTriangle.shape.position.y = challengeMediumTriangle.position.y - 75
                // animar enquanto ele muda de posição
            }
        }
        self.currentNode = nil
    }
}


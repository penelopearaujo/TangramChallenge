import Foundation
import SpriteKit
import UIKit

extension ThirdScene {
    
    // MARK: Create draggable Tangram
    func setTangram(){
        
        // create triangle 1
        self.bigTri1Path.move(to: CGPoint(x: frame.minX, y: frame.minY))
        self.bigTri1Path.addLine(to: CGPoint(x: 100, y: 100))
        self.bigTri1Path.addLine(to: CGPoint(x: 0, y: 200))
        self.bigTri1Path.addLine(to: CGPoint(x: 0, y: 0))
        bigTri1Shape = SKShapeNode(path: bigTri1Path.cgPath)
        self.bigTri1Shape.fillColor = #colorLiteral(red: 0.9843137255, green: 0.7490196078, blue: 0.2862745098, alpha: 1)
        self.bigTri1Shape.zPosition = 1
        let bigTri1Texture = view?.texture(from: bigTri1Shape)
        bigTri1 = SKSpriteNode(texture: bigTri1Texture)
        self.bigTri1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.bigTri1.name = PieceIdentifier.triangle1.rawValue
        self.bigTri1.position = CGPoint(x: 50, y: 100)
        bigTriangle1.shape = bigTri1
        self.addChild(bigTriangle1.shape)
        
        // create triangle 2
        self.bigTri2Path.move(to: CGPoint(x: frame.minX, y: frame.minY + 200))
        self.bigTri2Path.addLine(to: CGPoint(x: 100, y: 100))
        self.bigTri2Path.addLine(to: CGPoint(x: 200, y: 200))
        self.bigTri2Path.addLine(to: CGPoint(x: 0, y: 200))
        bigTri2Shape = SKShapeNode(path: bigTri2Path.cgPath)
        self.bigTri2Shape.fillColor = #colorLiteral(red: 0.9490196078, green: 0.5176470588, blue: 0.5098039216, alpha: 1)
        self.bigTri2Shape.zPosition = 1
        let bigTri2Texture = view?.texture(from: bigTri2Shape)
        bigTri2 = SKSpriteNode(texture: bigTri2Texture)
        self.bigTri2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.bigTri2.name = PieceIdentifier.triangle2.rawValue
        self.bigTri2.position = CGPoint(x: 100, y: 150)
        bigTriangle2.shape = bigTri2
        addChild(bigTriangle2.shape)
        
        // create triangle 3
        self.smallTri1Path.move(to: CGPoint(x: frame.minX, y: frame.minY))
        self.smallTri1Path.addLine(to: CGPoint(x: 100, y: 0))
        self.smallTri1Path.addLine(to: CGPoint(x: 50, y: 50))
        self.smallTri1Path.addLine(to: CGPoint(x: 0, y: 0))
        smallTri1Shape = SKShapeNode(path: smallTri1Path.cgPath)
        self.smallTri1Shape.fillColor = #colorLiteral(red: 0.8392156863, green: 0.6980392157, blue: 0.6823529412, alpha: 1)
        self.smallTri1Shape.zPosition = 1
        let smallTri1Texture = view?.texture(from: smallTri1Shape)
        smallTri1 = SKSpriteNode(texture: smallTri1Texture)
        self.smallTri1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.smallTri1.name = PieceIdentifier.triangle3.rawValue
        self.smallTri1.position = CGPoint(x: 50, y: 25)
        smallTriangle1.shape = smallTri1
        addChild(smallTriangle1.shape)
        
        // create triangle 4
        self.smallTri2Path.move(to: CGPoint(x: frame.minX + 100, y: frame.minY + 100))
        self.smallTri2Path.addLine(to: CGPoint(x: 150, y: 50))
        self.smallTri2Path.addLine(to: CGPoint(x: 150, y: 150))
        self.smallTri2Path.addLine(to: CGPoint(x: 100, y: 100))
        smallTri2Shape = SKShapeNode(path: smallTri2Path.cgPath)
        self.smallTri2Shape.fillColor = #colorLiteral(red: 0.5176470588, green: 0.6470588235, blue: 0.6156862745, alpha: 1)
        self.smallTri2Shape.zPosition = 1
        let smallTri2Texture = view?.texture(from: smallTri2Shape)
        smallTri2 = SKSpriteNode(texture: smallTri2Texture)
        self.smallTri2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.smallTri2.name = PieceIdentifier.triangle4.rawValue
        self.smallTri2.position = CGPoint(x: 125, y: 100)
        smallTriangle2.shape = smallTri2
        addChild(smallTriangle2.shape)
        
        // create square
        self.squarePath.move(to: CGPoint(x: frame.minX + 100, y: frame.minY))
        self.squarePath.addLine(to: CGPoint(x: 150, y: 50))
        self.squarePath.addLine(to: CGPoint(x: 100, y: 100))
        self.squarePath.addLine(to: CGPoint(x: 50, y: 50))
        self.squarePath.addLine(to: CGPoint(x: 100, y: 0))
        squareShape = SKShapeNode(path: squarePath.cgPath)
        self.squareShape.fillColor = #colorLiteral(red: 0.7294117647, green: 0.8470588235, blue: 0.8588235294, alpha: 1)
        self.squareShape.zPosition = 1
        let squareTexture = view?.texture(from: squareShape)
        squareSK = SKSpriteNode(texture: squareTexture)
        self.squareSK.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.squareSK.name = PieceIdentifier.square.rawValue
        self.squareSK.position = CGPoint(x: 100, y: 50)
        square.shape = squareSK
        addChild(square.shape)
        
        // create medium triangle
        self.mediumTriPath.move(to: CGPoint(x: frame.minX + 100, y: frame.minY))
        self.mediumTriPath.addLine(to: CGPoint(x: 200, y: 0))
        self.mediumTriPath.addLine(to: CGPoint(x: 200, y: 100))
        self.mediumTriPath.addLine(to: CGPoint(x: 100, y: 0))
        mediumTriShape = SKShapeNode(path: mediumTriPath.cgPath)
        self.mediumTriShape.fillColor = #colorLiteral(red: 0.9843137255, green: 0.8156862745, blue: 0.6352941176, alpha: 1)
        self.mediumTriShape.zPosition = 1
        let mediumTriTexture = view?.texture(from: mediumTriShape)
        mediumTri = SKSpriteNode(texture: mediumTriTexture)
        self.mediumTri.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.mediumTri.name = PieceIdentifier.square.rawValue
        self.mediumTri.position = CGPoint(x: 150, y: 50)
        mediumTriangle.shape = mediumTri
        addChild(mediumTriangle.shape)
        
        // create parallelogram
        self.parallelPath.move(to: CGPoint(x: frame.minX + 150, y: frame.minY + 50))
        self.parallelPath.addLine(to: CGPoint(x: 200, y: 100))
        self.parallelPath.addLine(to: CGPoint(x: 200, y: 200))
        self.parallelPath.addLine(to: CGPoint(x: 150, y: 150))
        self.parallelPath.addLine(to: CGPoint(x: 150, y: 50))
        parallelShape = SKShapeNode(path: parallelPath.cgPath)
        self.parallelShape.fillColor = #colorLiteral(red: 0.831372549, green: 0.9019607843, blue: 0.7098039216, alpha: 1)
        self.parallelShape.zPosition = 1
        let parallelTexture = view?.texture(from: parallelShape)
        parallel = SKSpriteNode(texture: parallelTexture)
        self.parallel.name = PieceIdentifier.parallelogram.rawValue
        self.parallel.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.parallel.position = CGPoint(x: 175, y: 125)
        parallelogram.shape = parallel
        addChild(parallelogram.shape)
        
    }
    
    func setChallenge(){
        
        // create challenge parallelogram
        let parallelPath = UIBezierPath()
        parallelPath.move(to: CGPoint(x: frame.minX + 150, y: frame.minY + 50))
        parallelPath.addLine(to: CGPoint(x: 200, y: 100))
        parallelPath.addLine(to: CGPoint(x: 200, y: 200))
        parallelPath.addLine(to: CGPoint(x: 150, y: 150))
        parallelPath.addLine(to: CGPoint(x: 150, y: 50))
        let parallelShape = SKShapeNode(path: parallelPath.cgPath)
        parallelShape.fillColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        parallelShape.strokeColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        parallelShape.zPosition = 1
        let parallelTexture = view?.texture(from: parallelShape)
        let parallel = SKSpriteNode(texture: parallelTexture)
        parallel.name = "parallelogramChallenge"
        parallel.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        parallel.position = CGPoint(x: 300, y: 100)
        addChild(parallel)
        
        // create challenge triangle 1
        let bigTri1Path = UIBezierPath()
        bigTri1Path.move(to: CGPoint(x: frame.minX, y: frame.minY))
        bigTri1Path.addLine(to: CGPoint(x: 100, y: 100))
        bigTri1Path.addLine(to: CGPoint(x: 0, y: 200))
        bigTri1Path.addLine(to: CGPoint(x: 0, y: 0))
        let bigTri1Shape = SKShapeNode(path: bigTri1Path.cgPath)
        bigTri1Shape.fillColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        bigTri1Shape.strokeColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        bigTri1Shape.zPosition = 1
        let bigTri1Texture = view?.texture(from: bigTri1Shape)
        let bigTri1 = SKSpriteNode(texture: bigTri1Texture)
        bigTri1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        bigTri1.position = CGPoint(x: 375, y: 175)
        addChild(bigTri1)
        
        // create challenge triangle 2
        let bigTri2Path = UIBezierPath()
        bigTri2Path.move(to: CGPoint(x: frame.minX + 200, y: frame.minY))
        bigTri2Path.addLine(to: CGPoint(x: 200, y: 200))
        bigTri2Path.addLine(to: CGPoint(x: 100, y: 100))
        bigTri2Path.addLine(to: CGPoint(x: 200, y: 0))
        let bigTri2Shape = SKShapeNode(path: bigTri2Path.cgPath)
        bigTri2Shape.fillColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        bigTri2Shape.strokeColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        bigTri2Shape.zPosition = 1
        let bigTri2Texture = view?.texture(from: bigTri2Shape)
        let bigTri2 = SKSpriteNode(texture: bigTri2Texture)
        bigTri2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        bigTri2.name = "triangle2Challenge"
        bigTri2.position = CGPoint(x: 375, y: 273)
        addChild(bigTri2)
        
        // create challenge square
        let squarePath = UIBezierPath()
        squarePath.move(to: CGPoint(x: frame.minX + 100, y: frame.minY))
        squarePath.addLine(to: CGPoint(x: 150, y: 50))
        squarePath.addLine(to: CGPoint(x: 100, y: 100))
        squarePath.addLine(to: CGPoint(x: 50, y: 50))
        squarePath.addLine(to: CGPoint(x: 100, y: 0))
        let squareShape = SKShapeNode(path: squarePath.cgPath)
        squareShape.fillColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        squareShape.strokeColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        squareShape.zPosition = 1
        let squareTexture = view?.texture(from: squareShape)
        let square = SKSpriteNode(texture: squareTexture)
        square.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        square.name = "squareChallenge"
        square.position = CGPoint(x: 425, y: 125)
        addChild(square)
        
        // create challenge triangle 3
        let smallTri1Path = UIBezierPath()
        smallTri1Path.move(to: CGPoint(x: frame.minX + 100, y: frame.minY + 100))
        smallTri1Path.addLine(to: CGPoint(x: 150, y: 50))
        smallTri1Path.addLine(to: CGPoint(x: 150, y: 150))
        smallTri1Path.addLine(to: CGPoint(x: 100, y: 100))
        let smallTri1Shape = SKShapeNode(path: smallTri1Path.cgPath)
        smallTri1Shape.fillColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        smallTri1Shape.strokeColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        smallTri1Shape.zPosition = 1
        let smallTri1Texture = view?.texture(from: smallTri1Shape)
        let smallTri1 = SKSpriteNode(texture: smallTri1Texture)
        smallTri1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        smallTri1.name = "triangle3Challenge"
        smallTri1.position = CGPoint(x: 450, y: 75)
        addChild(smallTri1)
        
        // create challenge triangle 4
        let smallTri2Path = UIBezierPath()
        smallTri2Path.move(to: CGPoint(x: frame.minX, y: frame.minY))
        smallTri2Path.addLine(to: CGPoint(x: 100, y: 0))
        smallTri2Path.addLine(to: CGPoint(x: 50, y: 50))
        smallTri2Path.addLine(to: CGPoint(x: 0, y: 0))
        let smallTri2Shape = SKShapeNode(path: smallTri2Path.cgPath)
        smallTri2Shape.fillColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        smallTri2Shape.strokeColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        smallTri2Shape.zPosition = 1
        let smallTri2Texture = view?.texture(from: smallTri2Shape)
        let smallTri2 = SKSpriteNode(texture: smallTri2Texture)
        smallTri2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        smallTri2.name = "triangle4Challenge"
        smallTri2.position = CGPoint(x: 375, y: 399)
        addChild(smallTri2)
        
        // create challenge medium triangle
        let mediumTriPath = UIBezierPath()
        mediumTriPath.move(to: CGPoint(x: frame.minX + 100, y: frame.minY + 100))
        mediumTriPath.addLine(to: CGPoint(x: 200, y: 100))
        mediumTriPath.addLine(to: CGPoint(x: 100, y: 0))
        mediumTriPath.addLine(to: CGPoint(x: 100, y: 100))
        let mediumTriShape = SKShapeNode(path: mediumTriPath.cgPath)
        mediumTriShape.fillColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        mediumTriShape.strokeColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        mediumTriShape.zPosition = 1
        let mediumTriTexture = view?.texture(from: mediumTriShape)
        let mediumTri = SKSpriteNode(texture: mediumTriTexture)
        mediumTri.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        mediumTri.name = "triangle5Challenge"
        mediumTri.position = CGPoint(x: 375, y: 324)
        addChild(mediumTri)
    }
    
}

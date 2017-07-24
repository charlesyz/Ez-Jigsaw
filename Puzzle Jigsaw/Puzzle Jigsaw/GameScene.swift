//
//  GameScene.swift
//  Puzzle Jigsaw
//
//  Created by Charles Zhang on 2017-07-11.
//  Copyright © 2017 Charles Zhang. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

class GameScene: SKScene {
    
    //let image = UIImage(named: "imageCar")      // defaut image
    var tileHeight : CGFloat = 0                // size of each tile - to be calculated later
    var tileWidth : CGFloat = 0
    let tinyNum : CGFloat = 0.000000000001
    var zPos : CGFloat = 0.000000000001
    var moveableNode : SKNode?                  // for click and drag
    
    var resetButton = SKSpriteNode()
    var backButton = SKSpriteNode()
    let resetLabel = UILabel()
    let backLabel = UILabel()
    let doneMessage = UILabel()

    
    //var grid = Matrix<piece>(rows: hCount, columns: wCount)
    var pieces = [Piece]()
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.lightGray
        
        tileHeight = (size.width - 20) / CGFloat(hCount)
        tileWidth = (size.width - 20) / CGFloat(wCount)
        
        setImage()
        reset()
    }
    
    func reset(){
        let imageTiles = cropImage(image: image!)
        
        for _ in 0..<pieces.count{
            if pieces.count == 0{
                break;
            }
            pieces[0].sprite?.removeFromParent()
            pieces.remove(at: 0)
        }
        
        for i in 0..<hCount * wCount{
            var p = Piece()
            p.image.image = imageTiles.0[i]
            p.image.point = imageTiles.1[i]
            pieces.append(p)
        }
        
        drawPieces()
    }
    
    func setImage(){
        
        let s = SKSpriteNode()
        s.color = SKColor.darkGray
        s.size = CGSize(width: size.width - 18, height: size.width - 18)
        s.position = CGPoint(x: size.width * 0.5 , y: size.height - size.width + 9)
        s.anchorPoint = CGPoint(x: 0.5, y: 0)
        addChild(s)
        
        resetButton = SKSpriteNode()
        resetButton.color = SKColor.gray
        resetButton.size = CGSize(width: size.width * 0.5 - 20, height: (size.height - size.width) * 0.25)
        resetButton.position = CGPoint(x: 10, y: 10)
        resetButton.anchorPoint = CGPoint(x: 0, y: 0)
        resetButton.name = "resetButton"
        self.addChild(resetButton)
        
        backButton = SKSpriteNode()//texture: SKTexture(image: image!))
        backButton.color = SKColor.gray
        backButton.size = CGSize(width: size.width * 0.5 - 20, height: (size.height - size.width) * 0.25)
        backButton.position = CGPoint(x: size.width * 0.5 + 10, y: 10)
        backButton.anchorPoint = CGPoint(x: 0, y: 0)
        backButton.name = "backButton"
        self.addChild(backButton)
        
        resetLabel.backgroundColor = UIColor.clear
        resetLabel.text = "Restart"
        resetLabel.textColor = UIColor.black
        resetLabel.translatesAutoresizingMaskIntoConstraints = false
        resetLabel.tag = 103
        resetLabel.frame = CGRect(x: 10, y: size.height - 20 - (size.height - size.width) * 0.125 ,width: size.width * 0.5 - 20, height: 20)
        resetLabel.textAlignment = NSTextAlignment.center
        self.view?.addSubview(resetLabel)
        
        backLabel.backgroundColor = UIColor.clear
        backLabel.text = "Back"
        backLabel.textColor = UIColor.black
        backLabel.translatesAutoresizingMaskIntoConstraints = false
        backLabel.tag = 104
        backLabel.frame = CGRect(x: size.width * 0.5 + 10, y: size.height - 20 - (size.height - size.width) * 0.125,width: size.width * 0.5 - 20, height: 20)
        backLabel.textAlignment = NSTextAlignment.center
        self.view?.addSubview(backLabel)

    }
    
    func cropImage(image: UIImage) -> ([UIImage], [CGPoint]) {
        let sz = image.size
        var tiles:[UIImage] = []
        var points:[CGPoint] = []
        
        
        for i in 0..<Int(hCount) {
            for j in 0..<Int(wCount) {
                UIGraphicsBeginImageContextWithOptions(
                    CGSize(width:sz.width/CGFloat(wCount), height:sz.height/CGFloat(wCount)),
                    false, 0)
                image.draw(at:CGPoint(x: -sz.width/CGFloat(wCount)*CGFloat(j), y: -sz.height/CGFloat(hCount)*CGFloat(i)))
                let tmpImg = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                
                tiles.append(tmpImg!)
                points.append(CGPoint(x: tileWidth * 0.5 + tileWidth * CGFloat(j) + 10, y: size.height - 10 - tileHeight * CGFloat(i) - tileHeight * 0.5))
            }
        }
                return (tiles, points)
    }
    
    func drawPieces(){
        var k = 0
        for _ in 0..<Int(hCount) {
            for _ in 0..<Int(wCount) {
                let s = SKSpriteNode(texture: SKTexture(image: pieces[k].image.image))
                s.size = CGSize(width: tileWidth, height: tileHeight)
                s.name = "\(k)"
                
                // put the pieces in random positions in the bottom box
                
                s.position = CGPoint(x: CGFloat(arc4random_uniform(UInt32(size.width - tileWidth)) + UInt32(tileWidth * 0.5)), y: CGFloat(arc4random_uniform(UInt32((size.height - size.width) * 0.75 - tileHeight)) + UInt32(tileHeight * 0.5 + (size.height - size.width) * 0.25) + 10))
                
                //s.position = imageTiles.point[k]
                
                pieces[k].sprite = s
                addChild(pieces[k].sprite!)
                k += 1
            }
        }
        

    }
    func checkCorrect() -> Bool{
        var isCorrect = true;
        for i in 0..<pieces.count{
            if pieces[i].sprite?.contains(pieces[i].image.point) == false{
                isCorrect = false;
            }
        }
        if isCorrect{
            print("Correct!")
            return true;
        }
        return false;
    }
    
    func bringToFront(sprite: SKSpriteNode) -> SKSpriteNode?{
        
        for i in 0..<pieces.count {
            if pieces[i].sprite == sprite{
                let p = pieces[i]
                pieces.remove(at: i)
                /*for j in i...pieces.count - 2{
                    pieces[j] = pieces[j + 1]
                }
                pieces[pieces.count - 1] = p*/
                pieces.append(p)
                p.sprite?.zPosition = zPos
                zPos += tinyNum
                return p.sprite!
            }
        }
        return sprite
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            let location = touch.location(in: self)
            for i in stride(from: pieces.count - 1, to: -1, by: -1){
                if (pieces[i].sprite?.contains(location))! {
                    //print("Bring to Front")
                    moveableNode = bringToFront(sprite: pieces[i].sprite!)
                    moveableNode!.position = location
                    break;
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, moveableNode != nil {
            moveableNode!.position = touch.location(in: self)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            // if piece
            if moveableNode != nil{
                moveableNode!.position = touch.location(in: self)
                for p in pieces{
                    let node = p.image.point
                    if moveableNode!.contains(node){
                        var overlap : Bool = false
                        for s in pieces{
                            if (s.sprite?.contains(node)) == true && s.sprite != moveableNode{
                                overlap = true;
                                break;
                            }
                        }
                        if overlap == false{
                            moveableNode!.run(SKAction.move(to: node, duration: 0.05))
                            break;
                        }
                    }
                }
                //moveableNode!.zPosition = 0.0
                moveableNode = nil
            }
            // if button
            else{
                let touchLocation = touch.location(in: self)
                
                if (resetButton.contains(touchLocation)) {
                    if let viewWithTag = self.view?.viewWithTag(105) {
                        viewWithTag.removeFromSuperview()
                    }
                    reset()
                }
                if (backButton.contains(touchLocation)) {
                    if let viewWithTag = self.view?.viewWithTag(103) {
                        viewWithTag.removeFromSuperview()
                    }
                    if let viewWithTag = self.view?.viewWithTag(104) {
                        viewWithTag.removeFromSuperview()
                    }
                    if let viewWithTag = self.view?.viewWithTag(105) {
                        viewWithTag.removeFromSuperview()
                    }
                    
                    image = UIImage(named: "defaultPhoto")
                    let scene = MenuScene(size: size)
                    scene.scaleMode = scaleMode
                    //let transition = SKTransition.moveIn(with: .right, duration: 1)
                    self.view?.presentScene(scene)//, transition: transition)
                }
            }
                        // check correct
            if checkCorrect(){
                doneMessage.backgroundColor = UIColor.clear
                doneMessage.text = "Puzzle Complete!"
                doneMessage.font = doneMessage.font.withSize(30)
                doneMessage.textColor = UIColor.black
                doneMessage.translatesAutoresizingMaskIntoConstraints = false
                doneMessage.tag = 105
                doneMessage.frame = CGRect(x: 10, y: size.width + 10,width: size.width - 20, height: 40)
                doneMessage.textAlignment = NSTextAlignment.center
                self.view?.addSubview(doneMessage)
            }
        }
        
        
        
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            moveableNode = nil
        }
    }
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

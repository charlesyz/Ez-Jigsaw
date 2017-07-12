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

class GameScene: SKScene, UIGestureRecognizerDelegate {
    
    let hCount = 9                                              // # pieces in the puzzle height wise
    let wCount = 9                                              // # pieces in the puzzle length wise
    let image = UIImage(named: "imageCar")      // defaut image
    var tileHeight : CGFloat = 0                // size of each tile - to be calculated later
    var tileWidth : CGFloat = 0
    
    //var imageView: UIImageView?
    var moveableNode : SKNode?                  // for click and drag
    
    var imageTiles = (image: [UIImage](), point: [CGPoint]())
    //var grid = Matrix<piece>(rows: hCount, columns: wCount)
    var sprites = [SKSpriteNode]()
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.lightGray
        
        tileHeight = (size.height - 20) / CGFloat(hCount)
        tileWidth = (size.height - 20) / CGFloat(wCount)
        
        setImage()
        imageTiles = cropImage(image: image!)
        drawPieces()
    }
    
    func setImage(){
        /*imageView = UIImageView(image: image!)
        imageView?.frame = CGRect(x: (size.width - size.height) / 2, y: CGFloat(10), width: size.height - 20 , height:size.height - 20)
        self.view?.addSubview(imageView!)
        imageView?.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(GameScene.handleTap(gestureRecognizer:)))
        gestureRecognizer.delegate = self
        imageView?.addGestureRecognizer(gestureRecognizer)*/
        
        let s = SKSpriteNode()//texture: SKTexture(image: image!))
        s.color = SKColor.darkGray
        s.size = CGSize(width: size.height - 18, height: size.height - 18)
        s.position = CGPoint(x: size.width * 0.5 , y: size.height * 0.5)
        //s.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        //s.zPosition = 1.0
        addChild(s)
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
                points.append(CGPoint(x: tileWidth * 0.75 + tileWidth * CGFloat(j) + (size.width - size.height) * 0.5, y: size.height - 10 - tileHeight * CGFloat(i) - tileHeight * 0.5))
            }
        }
                return (tiles, points)
    }
    func drawPieces(){
        var k = 0
        for _ in 0..<Int(hCount) {
            for _ in 0..<Int(wCount) {
                let s = SKSpriteNode(texture: SKTexture(image: imageTiles.image[k]))
                s.size = CGSize(width: tileWidth, height: tileHeight)
                s.name = "\(k)"
                
                // put half the pieces in random positions on the left side
                
                s.position = CGPoint(x: CGFloat(arc4random_uniform(UInt32(0.5 * (size.width - size.height) - tileWidth)) + UInt32(tileWidth * 0.5)), y: CGFloat(arc4random_uniform(UInt32(size.height - tileHeight)) + UInt32(tileHeight * 0.5)))
                
                if arc4random_uniform(2) == 0{
                    s.position.x += (size.width - size.height) * 0.5 + size.height
                }
                
                addChild(s)
                sprites.append(s)
                k += 1
            }
        }
        

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            let location = touch.location(in: self)
            for s in sprites{
                if s.contains(location) {
                    print("Bring to Front")
                    s.bringToFront()
                    moveableNode = s
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
        if let touch = touches.first, moveableNode != nil {
            moveableNode!.position = touch.location(in: self)
            for node in imageTiles.point{
                if moveableNode!.contains(node){
                    var overlap : Bool = false
                    for s in sprites{
                        if s.contains(node) && s != moveableNode{
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

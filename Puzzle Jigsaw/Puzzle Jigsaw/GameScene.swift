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
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    let image = UIImage(named: "imageCar")
    var imageTiles = ([UIImage](), [CGPoint]())
    var grid = Matrix<piece>(rows: 9, columns: 9)
    var imageView: UIImageView?
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.lightGray
        //setImage()
        imageTiles = cropImage(image: image!, hCount: 9, wCount: 9)
    }
    
    func setImage(){
        imageView = UIImageView(image: image!)
        imageView?.frame = CGRect(x: (size.width - size.height) / 2, y: CGFloat(10), width: size.height - 20 , height:size.height - 20)
        self.view?.addSubview(imageView!)
        imageView?.isUserInteractionEnabled = true
        /*let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(GameScene.handleTap(gestureRecognizer:)))
        gestureRecognizer.delegate = self
        imageView?.addGestureRecognizer(gestureRecognizer)*/
        
        /*let sprite = SKSpriteNode(texture: SKTexture(image: image!))
        sprite.color = SKColor.white
        sprite.size = CGSize(width: size.height - 20, height: size.height - 20)
        sprite.position = CGPoint(x: size.width * 0.5 , y: size.height * 0.5)
        sprite.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(sprite)*/
    }
    
    func cropImage(image: UIImage, hCount: Float, wCount: Float) -> ([UIImage], [CGPoint]) {
        let sz = image.size
        let tileHeight = (size.height - 20) / CGFloat(hCount)
        let tileWidth = (size.height - 20) / CGFloat(wCount)
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
                points.append(CGPoint(x: tileWidth / 2 + tileWidth * CGFloat(j) + (size.width - size.height) / 2, y: size.height - 10 - tileHeight * CGFloat(i) - tileHeight / 2))
            }
        }
        var k = 0
        for _ in 0..<Int(hCount) {
            for _ in 0..<Int(wCount) {
                let s = SKSpriteNode(texture: SKTexture(image: tiles[k]))
                s.size = CGSize(width: (size.height - 20) / CGFloat(wCount), height: (size.height - 20)/CGFloat(hCount))
                s.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                s.position = points[k]
                addChild(s)
                k += 1
            }
        }
        
        return (tiles, points)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

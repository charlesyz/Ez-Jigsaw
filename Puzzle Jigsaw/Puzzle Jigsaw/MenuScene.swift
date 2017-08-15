//
//  MenuScene.swift
//  Puzzle Jigsaw
//
//  Created by Charles Zhang on 2017-07-13.
//  Copyright © 2017 Charles Zhang. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

var image = UIImage(named: "defaultPhoto")
var hCount = 3                                              // # pieces in the puzzle height wise
var wCount = 3                                              // # pieces in the puzzle length wise
var controller = GameViewController() 
let highlightColour = UIColor(red:0.13, green:0.27, blue:0.37, alpha:1.0)
let buttonColour = UIColor(red:0.01, green:0.08, blue:0.11, alpha:1.0)
let textColour = UIColor(red:0.65, green:0.88, blue:0.98, alpha:1.0)
let backgroundColour = UIColor(red:0.01, green:0.10, blue:0.15, alpha:1.0)

class MenuScene: SKScene , UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    var imageButton = SKSpriteNode()
    var startButton = SKSpriteNode()
    let slider = UISlider ()
    var sliderLabel = UILabel()
    var buttonLabel = UILabel()
    
    override func didMove(to view: SKView) {
        let bg = SKSpriteNode(imageNamed: "backgroundPhoto")
        bg.size.height = size.height
        bg.size.width = size.width
        bg.position = CGPoint(x: 0, y: 0)
        bg.anchorPoint = CGPoint(x: 0, y: 0)
        bg.zPosition = -1
        addChild(bg)
        initObjects()
    }
    
    func sliderValueDidChange(sender:UISlider!){
        hCount = Int(sender.value)
        wCount = Int(sender.value)
        sliderLabel.text = "Dimensions: \(hCount) x \(wCount)"
    }

    
    func initObjects(){
        imageButton = SKSpriteNode(texture: SKTexture(image: image!))
        imageButton.color = buttonColour
        imageButton.size = CGSize(width: size.width - 20, height: size.width - 20)
        imageButton.position = CGPoint(x: size.width * 0.5 , y: size.height - size.width + 10)
        imageButton.anchorPoint = CGPoint(x: 0.5, y: 0)
        imageButton.name = "imageButton"
        self.addChild(imageButton)
        
        startButton = SKSpriteNode()//texture: SKTexture(image: image!))
        startButton.color = buttonColour
        startButton.size = CGSize(width: size.width - 50, height: size.height - size.width - 120)
        startButton.position = CGPoint(x: size.width * 0.5, y: size.height - size.width - 10)
        startButton.anchorPoint = CGPoint(x: 0.5, y: 1)
        startButton.name = "startButton"
        self.addChild(startButton)
        
        buttonLabel.backgroundColor = UIColor.clear
        buttonLabel.text = "Press to Start"
        buttonLabel.textColor = textColour
        buttonLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonLabel.tag = 102
        buttonLabel.frame = CGRect(x: 20, y: size.height - 130 - (size.height - size.width - 120) * 0.5, width: size.width - 40, height: 50)
        buttonLabel.textAlignment = NSTextAlignment.center
        self.view?.addSubview(buttonLabel)
        
        slider.minimumValue = 2
        slider.maximumValue = 10
        slider.tintColor = UIColor.red
        slider.isContinuous = true
        slider.value = 3
        slider.frame = CGRect(x: 20, y: size.height - 70 ,width: size.width - 40, height: 50)
        slider.addTarget(self, action:#selector(sliderValueDidChange), for: .valueChanged)
        slider.tag = 100
        self.view?.addSubview(slider)

        sliderLabel.backgroundColor = UIColor.clear
        sliderLabel.text = "Dimensions: \(hCount) x \(wCount)"
        sliderLabel.textColor = textColour
        sliderLabel.translatesAutoresizingMaskIntoConstraints = false
        sliderLabel.tag = 101
        sliderLabel.frame = CGRect(x: 20, y: size.height - 100 ,width: size.width - 40, height: 50)
        sliderLabel.textAlignment = NSTextAlignment.center
        self.view?.addSubview(sliderLabel)
        
        

    }
    
    func cropSquare(image: UIImage) -> UIImage {
        let sz = image.size
        var bounds = sz.height
        if (sz.width < sz.height){
            bounds = sz.width
        }
        // crop
        UIGraphicsBeginImageContextWithOptions(CGSize(width:bounds, height:bounds),false, 0)
        if (sz.width < sz.height){
            image.draw(at:CGPoint(x: 0, y: -(sz.height - sz.width) / 2))
        }
        else{
        image.draw(at:CGPoint(x: -(sz.width - sz.height) / 2, y: 0))
        }
        var tmpImg = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // resize
        UIGraphicsBeginImageContextWithOptions(CGSize(width:size.width - 20, height:size.width - 20),false, 0)
        tmpImg?.draw(in: CGRect(x: 0, y: 0, width: size.width - 20, height: size.width - 20))
        tmpImg = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return tmpImg!
    }
    // Image Picker
    func selectImageFromPhotoLibrary() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        controller.present(imagePickerController, animated: true, completion: nil)
        print("Slect image")
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        image = info[UIImagePickerControllerOriginalImage] as? UIImage
        controller.dismiss(animated: true, completion: nil)
        image = cropSquare(image: image!)
        imageButton.removeFromParent()
        imageButton = SKSpriteNode(texture: SKTexture(image: image!))
        imageButton.color = buttonColour
        imageButton.size = CGSize(width: size.width - 20, height: size.width - 20)
        imageButton.position = CGPoint(x: size.width * 0.5 , y: size.height - size.width + 10)
        imageButton.anchorPoint = CGPoint(x: 0.5, y: 0)
        imageButton.name = "imageButton"
        self.addChild(imageButton)
        //imageButton.texture = SKTexture(image: image!)

    }
    
    // detect touches
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        // Check if the location of the touch is within the button's bounds
        if (imageButton.contains(touchLocation)) {
            selectImageFromPhotoLibrary()
        }
        if (startButton.contains(touchLocation)) {
            // remove UI elements before transitioning
            if let viewWithTag = self.view?.viewWithTag(100) {
                viewWithTag.removeFromSuperview()
            }
            if let viewWithTag = self.view?.viewWithTag(101) {
                viewWithTag.removeFromSuperview()
            }
            if let viewWithTag = self.view?.viewWithTag(102) {
                viewWithTag.removeFromSuperview()
            }

            let scene = GameScene(size: size)
            scene.scaleMode = scaleMode
            //let transition = SKTransition.moveIn(with: .right, duration: 1)
            self.view?.presentScene(scene)//, transition: transition)
        }
    } 
    
}


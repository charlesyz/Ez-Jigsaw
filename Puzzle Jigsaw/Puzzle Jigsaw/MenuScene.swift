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
    // UI Elements
    var imageButton = SKSpriteNode()
    var startButton = SKSpriteNode()
    var helpButton = SKSpriteNode()
    var helpScreen = SKSpriteNode()
    
    let slider = UISlider ()
    var sliderLabel = UILabel()
    var startLabel = UILabel()
    var helpLabel = UILabel()
    
    var inHelp: Bool = false
    
    override func didMove(to view: SKView) {
        
        // resize default image
        UIGraphicsBeginImageContextWithOptions(CGSize(width:size.width - 20, height:size.width - 20),false, 0)
        image?.draw(in: CGRect(x: 0, y: 0, width: size.width - 20, height: size.width - 20))
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // add background
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
    
    func removeObjects(){
        imageButton.removeFromParent()
        startButton.removeFromParent()
        helpButton.removeFromParent()
        
        if let viewWithTag = self.view?.viewWithTag(100) {
            viewWithTag.removeFromSuperview()
        }
        if let viewWithTag = self.view?.viewWithTag(101) {
            viewWithTag.removeFromSuperview()
        }
        if let viewWithTag = self.view?.viewWithTag(102) {
            viewWithTag.removeFromSuperview()
        }
        if let viewWithTag = self.view?.viewWithTag(103) {
            viewWithTag.removeFromSuperview()
        }
    }
    
    func initObjects(){
        let buttonHeight = (size.height - size.width ) * 0.5 - 70
        let buttonWidth = size.width - 50
        // Get the superview's layout
        let margins = view?.layoutMarginsGuide
        
        imageButton = SKSpriteNode(texture: SKTexture(image: image!))
        imageButton.color = buttonColour
        imageButton.size = CGSize(width: size.width - 20, height: size.width - 20)
        imageButton.position = CGPoint(x: size.width * 0.5 , y: size.height - size.width + 10)
        imageButton.anchorPoint = CGPoint(x: 0.5, y: 0)
        imageButton.name = "imageButton"
        self.addChild(imageButton)
        
        startButton = SKSpriteNode()
        startButton.color = buttonColour
        startButton.size = CGSize(width: buttonWidth, height: buttonHeight)
        startButton.position = CGPoint(x: size.width * 0.5, y: size.height - size.width - 10)
        startButton.anchorPoint = CGPoint(x: 0.5, y: 1)
        startButton.name = "startButton"
        self.addChild(startButton)
        
        self.view?.addSubview(startLabel)
        startLabel.backgroundColor = UIColor.clear
        startLabel.text = "Press to Start"
        startLabel.textColor = textColour
        startLabel.translatesAutoresizingMaskIntoConstraints = false
        startLabel.tag = 102
        startLabel.frame = CGRect(x: 20, y: size.width + buttonHeight * 0.5 - 10, width: buttonWidth, height: 50)
        startLabel.textAlignment = NSTextAlignment.center
        startLabel.leadingAnchor.constraint(equalTo: (margins?.leadingAnchor)!, constant: 10).isActive = true
        startLabel.topAnchor.constraint(equalTo: (margins?.topAnchor)!, constant: size.width + buttonHeight * 0.5 - 15).isActive = true
        startLabel.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        startLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        helpButton = SKSpriteNode()//texture: SKTexture(image: image!))
        helpButton.color = buttonColour
        helpButton.size = CGSize(width: buttonWidth, height: buttonHeight)
        helpButton.position = CGPoint(x: size.width * 0.5, y: size.height - size.width - 20 - buttonHeight)
        helpButton.anchorPoint = CGPoint(x: 0.5, y: 1)
        helpButton.name = "startButton"
        self.addChild(helpButton)
        
        self.view?.addSubview(helpLabel)
        helpLabel.backgroundColor = UIColor.clear
        helpLabel.text = "Help"
        helpLabel.textColor = textColour
        helpLabel.translatesAutoresizingMaskIntoConstraints = false
        helpLabel.tag = 103
        helpLabel.frame = CGRect(x: 20, y: size.width +  buttonHeight * 1.5, width: buttonWidth, height: 50)
        helpLabel.textAlignment = NSTextAlignment.center
        helpLabel.leadingAnchor.constraint(equalTo: (margins?.leadingAnchor)!, constant: 10).isActive = true
        helpLabel.topAnchor.constraint(equalTo: (margins?.topAnchor)!, constant: size.width + buttonHeight * 1.5 - 5).isActive = true
        helpLabel.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        helpLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        slider.minimumValue = 2
        slider.maximumValue = 10
        slider.tintColor = UIColor.red
        slider.isContinuous = true
        slider.value = Float(hCount)
        slider.frame = CGRect(x: 20, y: size.height - 70 ,width: size.width - 40, height: 50)
        slider.addTarget(self, action:#selector(sliderValueDidChange), for: .valueChanged)
        slider.tag = 100
        self.view?.addSubview(slider)

        self.view?.addSubview(sliderLabel)
        sliderLabel.backgroundColor = UIColor.clear
        sliderLabel.text = "Dimensions: \(hCount) x \(wCount)"
        sliderLabel.textColor = textColour
        sliderLabel.translatesAutoresizingMaskIntoConstraints = false
        sliderLabel.tag = 101
        sliderLabel.frame = CGRect(x: 20, y: size.height - 100 ,width: buttonWidth, height: 50)
        sliderLabel.textAlignment = NSTextAlignment.center
        sliderLabel.leadingAnchor.constraint(equalTo: (margins?.leadingAnchor)!, constant: 10).isActive = true
        sliderLabel.topAnchor.constraint(equalTo: (margins?.topAnchor)!, constant: size.height - 100).isActive = true
        sliderLabel.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        sliderLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func cropSquare(image: UIImage) -> UIImage {
        let sz = image.size
        // find whether the image is portrait or landscape
        var bounds = sz.height
        if (sz.width < sz.height){
            bounds = sz.width
        }
        // crop square out of the middle of the image
        UIGraphicsBeginImageContextWithOptions(CGSize(width:bounds, height:bounds),false, 0)
        if (sz.width < sz.height){
            image.draw(at:CGPoint(x: 0, y: -(sz.height - sz.width) / 2))
        }
        else{
        image.draw(at:CGPoint(x: -(sz.width - sz.height) / 2, y: 0))
        }
        var tmpImg = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // resize image to fit the screen
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
        print("Select image")
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // get image from imagepicker, then display it on screen
        image = info[UIImagePickerControllerOriginalImage] as? UIImage
        controller.dismiss(animated: false, completion: nil)
        image = cropSquare(image: image!)
        imageButton.texture = SKTexture(image: image!)
    }
    
    // detect touches
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        let helpScreen = SKSpriteNode(texture: SKTexture(image: UIImage(named: "helpPhoto")!))
        helpScreen.size = CGSize(width: size.width - 60, height: size.width - 60)
        helpScreen.position = CGPoint(x: size.width * 0.5 , y: size.height - size.width * 0.5)
        helpScreen.zPosition = 10
        helpScreen.name = "helpScreen"
        
        let helpBackground = SKSpriteNode(color: UIColor.darkGray.withAlphaComponent(0.75), size: CGSize(width: size.width, height: size.height))
        helpBackground.zPosition = 5
        helpBackground.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        helpBackground.name = "helpBackground"
        
        if (inHelp == true){
            childNode(withName: "helpScreen")?.removeFromParent()
            childNode(withName: "helpBackground")?.removeFromParent()
            inHelp = false
        }
        else if (imageButton.contains(touchLocation)) {
            selectImageFromPhotoLibrary()
        }
        
        if (helpButton.contains(touchLocation)){
            
            addChild(helpBackground)
            addChild(helpScreen)
            inHelp = true
        }
        else if (startButton.contains(touchLocation)) {
            // remove UI elements before transitioning
            removeObjects()
            // transition
            let scene = GameScene(size: size)
            scene.scaleMode = scaleMode
            self.view?.presentScene(scene)
         }
    } 
    
}


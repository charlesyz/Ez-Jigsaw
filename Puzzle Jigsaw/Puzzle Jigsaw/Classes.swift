//
//  Classes.swift
//  Puzzle Jigsaw
//
//  Created by Charles Zhang on 2017-07-11.
//  Copyright © 2017 Charles Zhang. All rights reserved.
//

import SpriteKit
import GameplayKit

struct Piece{
    var rotation : Int
    var sprite : SKSpriteNode?
    var image = (image: UIImage(), point: CGPoint())
    init() {
        rotation = 0;
        sprite = nil
    }
}

//
//  Extensions.swift
//  Puzzle Jigsaw
//
//  Created by Charles Zhang on 2017-07-12.
//  Copyright © 2017 Charles Zhang. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit


extension SKNode {
    func bringToFront() {
        guard let parent = parent else {
            print("No Parent")
            return
        }
        removeFromParent()
        parent.addChild(self)
    }
}

//
//  Classes.swift
//  Puzzle Jigsaw
//
//  Created by Charles Zhang on 2017-07-11.
//  Copyright © 2017 Charles Zhang. All rights reserved.
//

import SpriteKit
import GameplayKit

class Matrix<T> {
    let rows: Int, columns: Int
    var grid: Array<T?>
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array<T?>(repeating: nil, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> T? {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set(newValue) {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

struct Piece{
    var rotation : Int
    var sprite : SKSpriteNode?
    var image = (image: UIImage(), point: CGPoint())
    
    init() {
        rotation = 0;
        sprite = nil
    }
}

struct ConectionTags {
    var top     : Int = 0
    var right   : Int = 0
    var bottom  : Int = 0
    var left    : Int = 0
}

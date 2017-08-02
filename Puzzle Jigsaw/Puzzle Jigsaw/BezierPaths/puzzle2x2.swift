
//  Created by Charles Zhang on 2017-08-02.
//
//

import BezierPaths

// 2x2 puzzle
if let puzzle2 = [UiBezierPath](){
    
    //// Cut_Piece_1_1 Drawing
    let cut_Piece_1_1Path = UIBezierPath()
    cut_Piece_1_1Path.move(to: CGPoint(x: 141.75, y: 141.75))
    cut_Piece_1_1Path.addLine(to: CGPoint(x: 708.68, y: 141.75))
    cut_Piece_1_1Path.move(to: CGPoint(x: 708.68, y: 141.75))
    cut_Piece_1_1Path.addCurve(to: CGPoint(x: 708.68, y: 316.47), controlPoint1: CGPoint(x: 718.97, y: 192.43), controlPoint2: CGPoint(x: 724.52, y: 279))
    cut_Piece_1_1Path.addCurve(to: CGPoint(x: 722.93, y: 353.95), controlPoint1: CGPoint(x: 699.57, y: 339.17), controlPoint2: CGPoint(x: 710.26, y: 365.04))
    cut_Piece_1_1Path.addCurve(to: CGPoint(x: 788.26, y: 317.53), controlPoint1: CGPoint(x: 743.52, y: 335.48), controlPoint2: CGPoint(x: 753.02, y: 317.53))
    cut_Piece_1_1Path.addCurve(to: CGPoint(x: 844.47, y: 425.21), controlPoint1: CGPoint(x: 823.89, y: 317.53), controlPoint2: CGPoint(x: 844.47, y: 363.45))
    cut_Piece_1_1Path.addCurve(to: CGPoint(x: 788.26, y: 532.9), controlPoint1: CGPoint(x: 844.47, y: 487.5), controlPoint2: CGPoint(x: 823.89, y: 532.9))
    cut_Piece_1_1Path.addCurve(to: CGPoint(x: 722.93, y: 496.48), controlPoint1: CGPoint(x: 753.02, y: 532.9), controlPoint2: CGPoint(x: 743.52, y: 514.95))
    cut_Piece_1_1Path.addCurve(to: CGPoint(x: 708.68, y: 533.96), controlPoint1: CGPoint(x: 710.26, y: 485.39), controlPoint2: CGPoint(x: 699.57, y: 511.26))
    cut_Piece_1_1Path.addCurve(to: CGPoint(x: 708.68, y: 708.68), controlPoint1: CGPoint(x: 724.52, y: 571.43), controlPoint2: CGPoint(x: 718.97, y: 658.53))
    cut_Piece_1_1Path.move(to: CGPoint(x: 141.75, y: 708.68))
    cut_Piece_1_1Path.addCurve(to: CGPoint(x: 316.47, y: 708.68), controlPoint1: CGPoint(x: 192.43, y: 718.97), controlPoint2: CGPoint(x: 279, y: 724.52))
    cut_Piece_1_1Path.addCurve(to: CGPoint(x: 353.95, y: 722.93), controlPoint1: CGPoint(x: 339.17, y: 699.57), controlPoint2: CGPoint(x: 365.04, y: 710.26))
    cut_Piece_1_1Path.addCurve(to: CGPoint(x: 317.53, y: 788.26), controlPoint1: CGPoint(x: 335.48, y: 743.52), controlPoint2: CGPoint(x: 317.53, y: 753.02))
    cut_Piece_1_1Path.addCurve(to: CGPoint(x: 425.21, y: 844.47), controlPoint1: CGPoint(x: 317.53, y: 823.89), controlPoint2: CGPoint(x: 363.45, y: 844.47))
    cut_Piece_1_1Path.addCurve(to: CGPoint(x: 532.9, y: 788.26), controlPoint1: CGPoint(x: 487.5, y: 844.47), controlPoint2: CGPoint(x: 532.9, y: 823.89))
    cut_Piece_1_1Path.addCurve(to: CGPoint(x: 496.48, y: 722.93), controlPoint1: CGPoint(x: 532.9, y: 753.02), controlPoint2: CGPoint(x: 514.95, y: 743.52))
    cut_Piece_1_1Path.addCurve(to: CGPoint(x: 533.96, y: 708.68), controlPoint1: CGPoint(x: 485.39, y: 710.26), controlPoint2: CGPoint(x: 511.26, y: 699.57))
    cut_Piece_1_1Path.addCurve(to: CGPoint(x: 708.68, y: 708.68), controlPoint1: CGPoint(x: 571.43, y: 724.52), controlPoint2: CGPoint(x: 658.53, y: 718.97))
    cut_Piece_1_1Path.move(to: CGPoint(x: 141.75, y: 141.75))
    cut_Piece_1_1Path.addLine(to: CGPoint(x: 141.75, y: 708.68))
    strokeColor.setStroke()
    cut_Piece_1_1Path.lineWidth = 1.89
    cut_Piece_1_1Path.miterLimit = 4
    cut_Piece_1_1Path.stroke()
    puzzle2.append(cut_Piece_1_1Path)
    
    //// Cut_Piece_1_2 Drawing
    let cut_Piece_1_2Path = UIBezierPath()
    cut_Piece_1_2Path.move(to: CGPoint(x: 141.82, y: 141.75))
    cut_Piece_1_2Path.addLine(to: CGPoint(x: 708.75, y: 141.75))
    cut_Piece_1_2Path.move(to: CGPoint(x: 708.75, y: 141.75))
    cut_Piece_1_2Path.addLine(to: CGPoint(x: 708.75, y: 708.68))
    cut_Piece_1_2Path.move(to: CGPoint(x: 141.82, y: 708.68))
    cut_Piece_1_2Path.addCurve(to: CGPoint(x: 316.55, y: 708.68), controlPoint1: CGPoint(x: 192.5, y: 698.39), controlPoint2: CGPoint(x: 279.07, y: 692.84))
    cut_Piece_1_2Path.addCurve(to: CGPoint(x: 354.02, y: 694.43), controlPoint1: CGPoint(x: 339.24, y: 717.79), controlPoint2: CGPoint(x: 365.11, y: 707.1))
    cut_Piece_1_2Path.addCurve(to: CGPoint(x: 317.6, y: 629.1), controlPoint1: CGPoint(x: 335.55, y: 673.84), controlPoint2: CGPoint(x: 317.6, y: 664.34))
    cut_Piece_1_2Path.addCurve(to: CGPoint(x: 425.29, y: 572.89), controlPoint1: CGPoint(x: 317.6, y: 593.47), controlPoint2: CGPoint(x: 363.53, y: 572.89))
    cut_Piece_1_2Path.addCurve(to: CGPoint(x: 532.97, y: 629.1), controlPoint1: CGPoint(x: 487.57, y: 572.89), controlPoint2: CGPoint(x: 532.97, y: 593.47))
    cut_Piece_1_2Path.addCurve(to: CGPoint(x: 496.55, y: 694.43), controlPoint1: CGPoint(x: 532.97, y: 664.34), controlPoint2: CGPoint(x: 515.02, y: 673.84))
    cut_Piece_1_2Path.addCurve(to: CGPoint(x: 534.03, y: 708.68), controlPoint1: CGPoint(x: 485.46, y: 707.1), controlPoint2: CGPoint(x: 511.33, y: 717.79))
    cut_Piece_1_2Path.addCurve(to: CGPoint(x: 708.75, y: 708.68), controlPoint1: CGPoint(x: 571.51, y: 692.84), controlPoint2: CGPoint(x: 658.6, y: 698.39))
    cut_Piece_1_2Path.move(to: CGPoint(x: 141.82, y: 141.75))
    cut_Piece_1_2Path.addCurve(to: CGPoint(x: 141.82, y: 316.47), controlPoint1: CGPoint(x: 152.11, y: 192.43), controlPoint2: CGPoint(x: 157.66, y: 279))
    cut_Piece_1_2Path.addCurve(to: CGPoint(x: 156.07, y: 353.95), controlPoint1: CGPoint(x: 132.72, y: 339.17), controlPoint2: CGPoint(x: 143.4, y: 365.04))
    cut_Piece_1_2Path.addCurve(to: CGPoint(x: 221.4, y: 317.53), controlPoint1: CGPoint(x: 176.66, y: 335.48), controlPoint2: CGPoint(x: 186.16, y: 317.53))
    cut_Piece_1_2Path.addCurve(to: CGPoint(x: 277.61, y: 425.21), controlPoint1: CGPoint(x: 257.03, y: 317.53), controlPoint2: CGPoint(x: 277.61, y: 363.45))
    cut_Piece_1_2Path.addCurve(to: CGPoint(x: 221.4, y: 532.9), controlPoint1: CGPoint(x: 277.61, y: 487.5), controlPoint2: CGPoint(x: 257.03, y: 532.9))
    cut_Piece_1_2Path.addCurve(to: CGPoint(x: 156.07, y: 496.48), controlPoint1: CGPoint(x: 186.16, y: 532.9), controlPoint2: CGPoint(x: 176.66, y: 514.95))
    cut_Piece_1_2Path.addCurve(to: CGPoint(x: 141.82, y: 533.96), controlPoint1: CGPoint(x: 143.4, y: 485.39), controlPoint2: CGPoint(x: 132.72, y: 511.26))
    cut_Piece_1_2Path.addCurve(to: CGPoint(x: 141.82, y: 708.68), controlPoint1: CGPoint(x: 157.66, y: 571.43), controlPoint2: CGPoint(x: 152.11, y: 658.53))
    strokeColor.setStroke()
    cut_Piece_1_2Path.lineWidth = 1.89
    cut_Piece_1_2Path.miterLimit = 4
    cut_Piece_1_2Path.stroke()
    puzzle2.append(cut_Piece_1_2Path)
    
    
    //// RowLayer_2
    //// Cut_Piece_2_1 Drawing
    let cut_Piece_2_1Path = UIBezierPath()
    cut_Piece_2_1Path.move(to: CGPoint(x: 141.75, y: 141.82))
    cut_Piece_2_1Path.addCurve(to: CGPoint(x: 316.47, y: 141.82), controlPoint1: CGPoint(x: 192.43, y: 152.11), controlPoint2: CGPoint(x: 279, y: 157.66))
    cut_Piece_2_1Path.addCurve(to: CGPoint(x: 353.95, y: 156.07), controlPoint1: CGPoint(x: 339.17, y: 132.72), controlPoint2: CGPoint(x: 365.04, y: 143.4))
    cut_Piece_2_1Path.addCurve(to: CGPoint(x: 317.53, y: 221.4), controlPoint1: CGPoint(x: 335.48, y: 176.66), controlPoint2: CGPoint(x: 317.53, y: 186.16))
    cut_Piece_2_1Path.addCurve(to: CGPoint(x: 425.21, y: 277.61), controlPoint1: CGPoint(x: 317.53, y: 257.03), controlPoint2: CGPoint(x: 363.45, y: 277.61))
    cut_Piece_2_1Path.addCurve(to: CGPoint(x: 532.9, y: 221.4), controlPoint1: CGPoint(x: 487.5, y: 277.61), controlPoint2: CGPoint(x: 532.9, y: 257.03))
    cut_Piece_2_1Path.addCurve(to: CGPoint(x: 496.48, y: 156.07), controlPoint1: CGPoint(x: 532.9, y: 186.16), controlPoint2: CGPoint(x: 514.95, y: 176.66))
    cut_Piece_2_1Path.addCurve(to: CGPoint(x: 533.96, y: 141.82), controlPoint1: CGPoint(x: 485.39, y: 143.4), controlPoint2: CGPoint(x: 511.26, y: 132.72))
    cut_Piece_2_1Path.addCurve(to: CGPoint(x: 708.68, y: 141.82), controlPoint1: CGPoint(x: 571.43, y: 157.66), controlPoint2: CGPoint(x: 658.53, y: 152.11))
    cut_Piece_2_1Path.move(to: CGPoint(x: 708.68, y: 141.82))
    cut_Piece_2_1Path.addCurve(to: CGPoint(x: 708.68, y: 316.55), controlPoint1: CGPoint(x: 718.97, y: 192.5), controlPoint2: CGPoint(x: 724.52, y: 279.07))
    cut_Piece_2_1Path.addCurve(to: CGPoint(x: 722.93, y: 354.02), controlPoint1: CGPoint(x: 699.57, y: 339.24), controlPoint2: CGPoint(x: 710.26, y: 365.11))
    cut_Piece_2_1Path.addCurve(to: CGPoint(x: 788.26, y: 317.6), controlPoint1: CGPoint(x: 743.52, y: 335.55), controlPoint2: CGPoint(x: 753.02, y: 317.6))
    cut_Piece_2_1Path.addCurve(to: CGPoint(x: 844.47, y: 425.29), controlPoint1: CGPoint(x: 823.89, y: 317.6), controlPoint2: CGPoint(x: 844.47, y: 363.53))
    cut_Piece_2_1Path.addCurve(to: CGPoint(x: 788.26, y: 532.97), controlPoint1: CGPoint(x: 844.47, y: 487.57), controlPoint2: CGPoint(x: 823.89, y: 532.97))
    cut_Piece_2_1Path.addCurve(to: CGPoint(x: 722.93, y: 496.55), controlPoint1: CGPoint(x: 753.02, y: 532.97), controlPoint2: CGPoint(x: 743.52, y: 515.02))
    cut_Piece_2_1Path.addCurve(to: CGPoint(x: 708.68, y: 534.03), controlPoint1: CGPoint(x: 710.26, y: 485.46), controlPoint2: CGPoint(x: 699.57, y: 511.33))
    cut_Piece_2_1Path.addCurve(to: CGPoint(x: 708.68, y: 708.75), controlPoint1: CGPoint(x: 724.52, y: 571.51), controlPoint2: CGPoint(x: 718.97, y: 658.6))
    cut_Piece_2_1Path.move(to: CGPoint(x: 141.75, y: 708.75))
    cut_Piece_2_1Path.addLine(to: CGPoint(x: 708.68, y: 708.75))
    cut_Piece_2_1Path.move(to: CGPoint(x: 141.75, y: 141.82))
    cut_Piece_2_1Path.addLine(to: CGPoint(x: 141.75, y: 708.75))
    strokeColor.setStroke()
    cut_Piece_2_1Path.lineWidth = 1.89
    cut_Piece_2_1Path.miterLimit = 4
    cut_Piece_2_1Path.stroke()
    puzzle2.append(cut_Piece_2_1Path)
    
    
    //// Cut_Piece_2_2 Drawing
    let cut_Piece_2_2Path = UIBezierPath()
    cut_Piece_2_2Path.move(to: CGPoint(x: 141.82, y: 141.82))
    cut_Piece_2_2Path.addCurve(to: CGPoint(x: 316.55, y: 141.82), controlPoint1: CGPoint(x: 192.5, y: 131.53), controlPoint2: CGPoint(x: 279.07, y: 125.99))
    cut_Piece_2_2Path.addCurve(to: CGPoint(x: 354.02, y: 127.57), controlPoint1: CGPoint(x: 339.24, y: 150.93), controlPoint2: CGPoint(x: 365.11, y: 140.24))
    cut_Piece_2_2Path.addCurve(to: CGPoint(x: 317.6, y: 62.25), controlPoint1: CGPoint(x: 335.55, y: 106.98), controlPoint2: CGPoint(x: 317.6, y: 97.48))
    cut_Piece_2_2Path.addCurve(to: CGPoint(x: 425.29, y: 6.03), controlPoint1: CGPoint(x: 317.6, y: 26.62), controlPoint2: CGPoint(x: 363.53, y: 6.03))
    cut_Piece_2_2Path.addCurve(to: CGPoint(x: 532.97, y: 62.25), controlPoint1: CGPoint(x: 487.57, y: 6.03), controlPoint2: CGPoint(x: 532.97, y: 26.62))
    cut_Piece_2_2Path.addCurve(to: CGPoint(x: 496.55, y: 127.57), controlPoint1: CGPoint(x: 532.97, y: 97.48), controlPoint2: CGPoint(x: 515.02, y: 106.98))
    cut_Piece_2_2Path.addCurve(to: CGPoint(x: 534.03, y: 141.82), controlPoint1: CGPoint(x: 485.46, y: 140.24), controlPoint2: CGPoint(x: 511.33, y: 150.93))
    cut_Piece_2_2Path.addCurve(to: CGPoint(x: 708.75, y: 141.82), controlPoint1: CGPoint(x: 571.51, y: 125.99), controlPoint2: CGPoint(x: 658.6, y: 131.53))
    cut_Piece_2_2Path.move(to: CGPoint(x: 708.75, y: 141.82))
    cut_Piece_2_2Path.addLine(to: CGPoint(x: 708.75, y: 708.75))
    cut_Piece_2_2Path.move(to: CGPoint(x: 141.82, y: 708.75))
    cut_Piece_2_2Path.addLine(to: CGPoint(x: 708.75, y: 708.75))
    cut_Piece_2_2Path.move(to: CGPoint(x: 141.82, y: 141.82))
    cut_Piece_2_2Path.addCurve(to: CGPoint(x: 141.82, y: 316.55), controlPoint1: CGPoint(x: 152.11, y: 192.5), controlPoint2: CGPoint(x: 157.66, y: 279.07))
    cut_Piece_2_2Path.addCurve(to: CGPoint(x: 156.07, y: 354.03), controlPoint1: CGPoint(x: 132.72, y: 339.25), controlPoint2: CGPoint(x: 143.4, y: 365.11))
    cut_Piece_2_2Path.addCurve(to: CGPoint(x: 221.4, y: 317.6), controlPoint1: CGPoint(x: 176.66, y: 335.55), controlPoint2: CGPoint(x: 186.16, y: 317.6))
    cut_Piece_2_2Path.addCurve(to: CGPoint(x: 277.61, y: 425.29), controlPoint1: CGPoint(x: 257.03, y: 317.6), controlPoint2: CGPoint(x: 277.61, y: 363.53))
    cut_Piece_2_2Path.addCurve(to: CGPoint(x: 221.4, y: 532.97), controlPoint1: CGPoint(x: 277.61, y: 487.58), controlPoint2: CGPoint(x: 257.03, y: 532.97))
    cut_Piece_2_2Path.addCurve(to: CGPoint(x: 156.07, y: 496.55), controlPoint1: CGPoint(x: 186.16, y: 532.97), controlPoint2: CGPoint(x: 176.66, y: 515.03))
    cut_Piece_2_2Path.addCurve(to: CGPoint(x: 141.82, y: 534.03), controlPoint1: CGPoint(x: 143.4, y: 485.47), controlPoint2: CGPoint(x: 132.72, y: 511.33))
    cut_Piece_2_2Path.addCurve(to: CGPoint(x: 141.82, y: 708.75), controlPoint1: CGPoint(x: 157.66, y: 571.51), controlPoint2: CGPoint(x: 152.11, y: 658.61))
    strokeColor.setStroke()
    cut_Piece_2_2Path.lineWidth = 1.89
    cut_Piece_2_2Path.miterLimit = 4
    cut_Piece_2_2Path.stroke()
    puzzle2.append(cut_Piece_2_2Path)
}


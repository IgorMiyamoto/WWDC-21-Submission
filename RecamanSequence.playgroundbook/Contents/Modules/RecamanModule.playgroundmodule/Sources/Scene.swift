//
//  Teste.swift
//  teste
//
//  Created by IgorMiyamoto on 16/04/21.
//

import SpriteKit

open class Scene: SKScene {
    //values
    var numbers : [Bool]!
    var count = 1
    var sequence : [Int] = []
    var index = 0
    
    open override func didMove(to view: SKView) {
        super.didMove(to: view)
        self.backgroundColor = .black
        numbers = Array(repeating: false, count: 1000)
        numbers[index] = true
        sequence.append(index)
        
        //        for _ in 0..<100 {
        //            step()
        //        }
        //        print(sequence)
    }
    
    open override func update(_ currentTime: TimeInterval) {
        if count < 289 {
            step()
        } else {
            self.view?.isPaused = true
        }
    }
    
    open func step() {
        var next = index - count
        if next < 0 || numbers[next] {
            next = index + count
        }
        numbers[index] = true
        sequence.append(next)
        
        let diameter = CGFloat(next - index)
        let x = CGFloat((next + index)/2)
        
        createArc(pos: x, diam: diameter,i: next%2)
        
        
        index = next
        count += 1
    }
    
    open func createArc(pos x: CGFloat, diam: CGFloat, i : Int){
        
        //creating UIBezierPaths
        var arc = UIBezierPath()
        
        if i == 0 {
            arc = UIBezierPath(arcCenter: CGPoint(x: x, y: 0), radius: diam/2, startAngle: .pi, endAngle: 0 , clockwise: false)
        } else {
            arc = UIBezierPath(arcCenter: CGPoint(x: x, y: 0), radius: diam/2, startAngle: 0, endAngle: .pi , clockwise: false)
        }
        arc.flatness = 100
        let red = SKShapeNode()
        red.lineWidth = 1
        red.strokeColor = SKColor.red
        red.path = arc.cgPath
        
        
        
        //adding arcs to the container
        
        
        //adding container to the GameScene
        self.addChild(red)
    }
    
}

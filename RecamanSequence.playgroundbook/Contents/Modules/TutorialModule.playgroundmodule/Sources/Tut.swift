import SpriteKit
import PlaygroundSupport

class Tut: SKScene {
    
    var DashPos : [CGPoint] = []
    var count = 1
    var sequence : [Int] = []
    var index = 0
    let labelCount = SKLabelNode(text: "")
    let labelSequence = SKLabelNode(text: "")
    var tut = 0
    var btn : ButtonNode!
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        self.backgroundColor = .black
        sequence.append(index)

    }
    
    override func didChangeSize(_ oldSize: CGSize) {
        super.didChangeSize(oldSize)
        self.removeAllChildren()
        
        drawNumberLine()
        createTut()
        self.attLabels(count: 1)
        
        btn = ButtonNode(image: SKShapeNode(rect: CGRect(x: 0, y: 0, width: 300, height: 100), cornerRadius: 10), label: SKLabelNode(text: "Next count")) {
            if(self.tut == 0) {
                let arc = self.createArc(pos: CGPoint(x: self.DashPos[0].x - 50, y: self.DashPos[0].y), diam: 100, i: 1, sta: 0, ena: .pi/2, lineWidth: 10, clockwise: true)
                arc.alpha = 0
                self.addChild(arc)
                arc.run(SKAction.sequence([SKAction.fadeIn(withDuration: 1), SKAction.removeFromParent()]))
                
                let diame = self.DashPos[1].x - self.DashPos[0].x
                
                let arc2 = self.createArc(pos: CGPoint(x: self.DashPos[0].x + diame/2, y: self.DashPos[0].y), diam: diame, i: 1, sta: .pi, ena: 0, lineWidth: 10, clockwise: true)
                arc2.alpha = 0
                self.addChild(arc2)
                arc2.run(SKAction.sequence([SKAction.wait(forDuration: 2),SKAction.fadeIn(withDuration: 0.5)]))
                
                self.sequence.append(1)
                self.attLabels(count: 1)
                self.tut += 1
            }
            else if(self.tut == 1) {
                
                let arc = self.createArc(pos: CGPoint(x: self.DashPos[1].x - 100, y: self.DashPos[0].y), diam: 200, i: 1, sta: 0, ena: .pi/2, lineWidth: 10, clockwise: true)
                arc.alpha = 0
                self.addChild(arc)
                arc.run(SKAction.sequence([SKAction.fadeIn(withDuration: 1), SKAction.removeFromParent()]))
                
                let diame = (self.DashPos[2].x - self.DashPos[1].x) * 2

                let arc2 = self.createArc(pos: CGPoint(x: self.DashPos[1].x + diame/2, y: self.DashPos[0].y), diam: diame, i: 0, sta: .pi, ena: 0, lineWidth: 10, clockwise: true)
                arc2.alpha = 0
                self.addChild(arc2)
                arc2.run(SKAction.sequence([SKAction.wait(forDuration: 2),SKAction.fadeIn(withDuration: 0.5)]))
                
                self.sequence.append(3)
                self.attLabels(count: 2)
                self.tut += 1
            }
            else if(self.tut == 2) {
                let diame = (self.DashPos[2].x - self.DashPos[1].x) * 3
                
                let arc = self.createArc(pos: CGPoint(x: self.DashPos[3].x - diame/2, y: self.DashPos[0].y), diam: diame, i: 0, sta: 0, ena: .pi, lineWidth: 10, clockwise: true)
                arc.alpha = 0
                self.addChild(arc)
                arc.run(SKAction.sequence([SKAction.fadeIn(withDuration: 1), SKAction.removeFromParent()]))
                
                
                let arc2 = self.createArc(pos: CGPoint(x: self.DashPos[3].x + diame/2, y: self.DashPos[0].y), diam: diame, i: 0, sta: .pi, ena: 0, lineWidth: 10, clockwise: false)
                arc2.alpha = 0
                self.addChild(arc2)
                arc2.run(SKAction.sequence([SKAction.wait(forDuration: 2),SKAction.fadeIn(withDuration: 0.5)]))

                self.sequence.append(6)
                self.attLabels(count: 3)
                self.tut += 1
            }
            else if(self.tut == 3) {
                let diame = (self.DashPos[2].x - self.DashPos[1].x) * 4
                
                let arc = self.createArc(pos: CGPoint(x: self.DashPos[4].x, y: self.DashPos[0].y), diam: diame, i: 1, sta: 0, ena: .pi, lineWidth: 10, clockwise: true)
                arc.alpha = 0
                self.addChild(arc)
                arc.run(SKAction.sequence([SKAction.fadeIn(withDuration: 0.5)]))
                self.sequence.append(2)
                self.attLabels(count: 4)
                self.tut += 1
                
                self.btn.removeFromParent()
            }
        }
        
        
        btn.position = CGPoint(x: size.width/4, y: -self.size.height/2 + 150)
        
        self.addChild(btn)
    }
        
    
    func createTut() {
        self.labelCount.text = "Count: \(count)"
        labelCount.position = CGPoint(x: self.size.width/2, y: self.size.height/2 - 100)
        self.labelSequence.text = "Sequence: "
        self.labelSequence.position = CGPoint(x: self.size.width/2, y: self.size.height/2 - 200)
        self.addChild(labelCount)
        self.addChild(labelSequence)
    }
    
    func attLabels(count: Int) {
        self.labelCount.text = "Count: \(count)"
        self.labelSequence.text = "Sequence: "
        for i in self.sequence {
            self.labelSequence.text! += "\(i) "
        }
//        self.labelSequence.position = CGPoint(x: self.labelCount.position.x + CGFloat(self.labelSequence.text?.count ?? 0) * 1.5, y: self.size.height/2 - 200)
    }
    
    func drawNumberLine(){
        DashPos.removeAll()
        let size = (self.size.width - 100) - 100
        let dist = size / 6
        
        let numberLine = SKShapeNode()
        let path = CGMutablePath()
        path.move(to: CGPoint(x: dist, y: 0))
        path.addLine(to: CGPoint(x: self.size.width - 100, y: 0))
        numberLine.path = path
        numberLine.strokeColor = SKColor.white
        numberLine.lineWidth = 5.0
        self.addChild(numberLine)
        
        for i in 1...7 {
            let a = SKSpriteNode(color: .white, size: CGSize(width: 2, height: 50))
            a.position = CGPoint(x: CGFloat(i)*dist, y: 0)
            
            DashPos.append(a.position)
            
            let num = SKLabelNode(text: "\(i - 1)")
            num.position = CGPoint(x: a.position.x - 20, y: -50)
            
            self.addChild(a)
            self.addChild(num)
        }
    }
    
    func createArc(pos: CGPoint, diam: CGFloat, i : Int, sta: CGFloat, ena: CGFloat, lineWidth : CGFloat, clockwise ckw : Bool) -> SKShapeNode {

        //creating UIBezierPaths
        var arc = UIBezierPath()
        
        if i == 0 {
            arc = UIBezierPath(arcCenter: pos, radius: diam/2, startAngle: ena, endAngle: sta , clockwise: ckw)
        } else {
            arc = UIBezierPath(arcCenter: pos, radius: diam/2, startAngle: sta, endAngle: ena , clockwise: ckw)
        }
        arc.flatness = 100
        let red = SKShapeNode()
        red.lineWidth = lineWidth
        red.strokeColor = SKColor.red
        red.path = arc.cgPath

        return red
       }

}

class ButtonNode: SKNode {
    var image : SKShapeNode?
        var label: SKLabelNode?
        var action : (() -> Void)?
        
        init(image: SKShapeNode, label: SKLabelNode, action: @escaping () -> Void) {
            self.image = image
            self.label = label
            self.action = action
            super.init()
            
            self.isUserInteractionEnabled = true
            self.addChild(image)
            
            label.verticalAlignmentMode = .center
            label.fontSize = 45
            self.addChild(label)
            label.position.x = image.position.x + image.frame.size.width/2
            label.position.y = image.position.y + image.frame.size.height/2
            
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.isUserInteractionEnabled = false
        }
        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.action!()
            self.isUserInteractionEnabled = true
        }
}


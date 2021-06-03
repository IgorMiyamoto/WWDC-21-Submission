
import PlaygroundSupport
import UIKit
import SpriteKit
import Foundation

open class ScreenTut: UIViewController {
    
    open override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let view = SKView()
        
        let scene = Tut()
        
        scene.scaleMode = .resizeFill
        scene.anchorPoint = CGPoint(x: 0, y: 0.5)
        
        view.presentScene(scene)
        
        self.view = view
        
    }
    
}

//
//  HelloScene.swift
//  SpriteWalkthrough
//
//  Created by Andriy Shvets on 10/26/16.
//  Copyright © 2016 Andriy Shvets. All rights reserved.
//

import Foundation
import SpriteKit

class HelloScene: SKScene {
    var contentCreated:Bool = false
    
    override func didMove(to view: SKView) {
        if !contentCreated {
            createSceneContents()
            contentCreated = !contentCreated
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let helloNode = self.childNode(withName: "helloNode") {
            helloNode.name = nil
            let moveUp = SKAction.moveBy(x: 0, y: 100, duration: 0.5)
            let zoom = SKAction.scale(to: 2.0, duration: 0.25)
            let pause = SKAction.wait(forDuration: 0.5)
            let fadeAway = SKAction.fadeOut(withDuration: 0.25)
            let remove = SKAction.removeFromParent()
            
            let moveSequence = SKAction.sequence([moveUp, zoom, pause, fadeAway, remove])
            
            helloNode.run(moveSequence) {
                let spaceshipScene = SpaceshipScene(size: self.size)
                let doors = SKTransition.doorsOpenVertical(withDuration: 0.5)
                
                self.view?.presentScene(spaceshipScene, transition: doors)
            }
        }
        
    }
    
    func createSceneContents() {
        self.backgroundColor = SKColor.cyan
        self.scaleMode = SKSceneScaleMode.aspectFit
        
        self.addChild(newHelloNode())
    }
    
    func newHelloNode() -> SKLabelNode {
        let helloNode:SKLabelNode = SKLabelNode(fontNamed: "Chalkduster")
        helloNode.text = "Hello, World!"
        helloNode.fontSize = 42
        helloNode.color  = SKColor.black
        helloNode.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        helloNode.name = "helloNode"
        
        return helloNode
    }
}

//
//  SpaceshipScene.swift
//  SpriteWalkthrough
//
//  Created by Andriy Shvets on 10/26/16.
//  Copyright © 2016 Andriy Shvets. All rights reserved.
//

import UIKit
import Math
import SpriteKit

class SpaceshipScene: SKScene {
    var contentCreated:Bool = false
    
    override func didMove(to view: SKView) {
        if !contentCreated {
            createSceneContents()
        }
    }
    
    func createSceneContents() {
        self.backgroundColor = SKColor.black
        self.scaleMode = SKSceneScaleMode.aspectFit
        
        let spaceShip = newspaceShip()
        
        let makeRocks = SKAction.sequence([SKAction.perform(#selector(addRock), onTarget: self),
                                           SKAction.wait(forDuration: 0.10, withRange: 0.15)])
        
        self.run(SKAction.repeatForever(makeRocks))
        
        self.addChild(spaceShip)
    }
    
    static inline CGFloat skRandf() {
        return rand() / (CGFloat) RAND_MAX;
    }
    
    func newspaceShip() -> SKSpriteNode {
        let hull = SKSpriteNode(color: SKColor.gray, size: CGSize(width: 64, height: 32))
        
        let hover = SKAction.sequence([SKAction.wait(forDuration: 1.0), SKAction.moveBy(x: 100, y: 50.0, duration: 1.0), SKAction.wait(forDuration: 1.0), SKAction.moveBy(x: -100, y: -50, duration: 1.0)])
        
        let light1 = newLight()
        light1.position = CGPoint(x: -28, y: 6)
        hull.addChild(light1)
        
        let light2 = newLight()
        light2.position = CGPoint(x: 28, y: 6)
        hull.addChild(light2)
        
        hull.run(SKAction.repeatForever(hover))
        
        hull.physicsBody = SKPhysicsBody(rectangleOf: hull.size)
        hull.physicsBody?.isDynamic = false
        
        return hull
    }
    
    func newLight() -> SKSpriteNode {
        let light = SKSpriteNode(color: SKColor.yellow, size: CGSize(width: 8, height: 8))
        
        let blink = SKAction.sequence([SKAction.fadeOut(withDuration: 0.25), SKAction.fadeIn(withDuration: 0.25)])
        let blinkForever = SKAction.repeatForever(blink)
        
        light.run(blinkForever)
        
        return light
    }
}

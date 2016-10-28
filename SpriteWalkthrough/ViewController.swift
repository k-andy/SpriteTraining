//
//  ViewController.swift
//  SpriteWalkthrough
//
//  Created by Andriy Shvets on 10/26/16.
//  Copyright © 2016 Andriy Shvets. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let spriteView:SKView = self.view as! SKView
        spriteView.showsDrawCount = true
        spriteView.showsNodeCount = true
        spriteView.showsFPS = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let hello:HelloScene = HelloScene(size: CGSize(width: 768, height: 1024))
        let spriteView:SKView = self.view as! SKView
        spriteView.presentScene(hello)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


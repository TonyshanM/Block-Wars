//
//  mainScene.swift
//  Block Wars
//
//  Created by 紫贝壳 on 2017/1/3.
//  Copyright © 2017年 紫贝壳. All rights reserved.
//

import UIKit
import SpriteKit

let wscreen = UIScreen.main.bounds.size.width
let hscreen = UIScreen.main.bounds.size.height

class mainScene: SKScene {

    override func didMove(to view: SKView) {
//        self.backgroundColor = UIColor.blue
        createContent()
    }
    func createContent() {
        let centerView:SKView = SKView.init(frame: CGRect(x: 10, y:  100, width: wscreen - 20, height: hscreen - 200))
        centerView.backgroundColor = UIColor.gray
        self.view?.addSubview(centerView)
        
        let fireBtn:UIButton = UIButton.init(type: .custom)
        fireBtn.frame = CGRect(x: wscreen - 50, y: hscreen - 100, width: 50, height: 50)
        fireBtn.backgroundColor = UIColor.blue
        self.view?.addSubview(fireBtn)
        
    }
}

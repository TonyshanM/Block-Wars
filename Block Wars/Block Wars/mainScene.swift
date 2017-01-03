//
//  mainScene.swift
//  Block Wars
//
//  Created by 紫贝壳 on 2017/1/3.
//  Copyright © 2017年 紫贝壳. All rights reserved.
//

import UIKit
import SpriteKit
import SnapKit
let wscreen = UIScreen.main.bounds.size.width
let hscreen = UIScreen.main.bounds.size.height
let hbtn:CGFloat = 50.0/667.0 * hscreen
let margin:CGFloat = 20.0/375.0 * wscreen
let wbtn:CGFloat = (wscreen - margin * 5)/4.0
var haveFinish:Bool = false
var fourCubic:SKSpriteNode? = nil
var selfcenterView:SKView? = nil
var cubicX:CGFloat = wscreen * 0.5



class mainScene: SKScene,SKPhysicsContactDelegate {

    override func didMove(to view: SKView) {
        createContent()
        self.physicsWorld.contactDelegate = self;
    }
    func createContent() {
//        let centerView:SKView = SKView.init()
//        centerView.backgroundColor = UIColor.gray
//        self.view?.addSubview(centerView)
//        selfcenterView = centerView
//        centerView.snp.makeConstraints { (make) in
//            make.centerX.equalToSuperview()
//            make.top.equalToSuperview().offset(64.0/667.0 * hscreen)
//            make.width.equalTo(wscreen - 20.0/375.0 * wscreen)
//            make.height.equalTo(hscreen - 140.0/667.0 * hscreen)
//        }
        
        for index in 1...4 {
            let btn:UIButton = UIButton.init()
            btn.backgroundColor = UIColor.green
            self.view?.addSubview(btn)
            btn.snp.makeConstraints({ (make) in
                make.left.equalTo(self.view!).offset(margin * CGFloat(index)  + wbtn * CGFloat(index - 1))
                make.bottom.equalTo(self.view!).offset(margin * -1)
                make.height.equalTo(hbtn)
                make.width.equalTo(wbtn)
            })
            switch index {
            case 1:
                btn.addTarget(self, action: #selector(mainScene.rightClick), for: .touchUpInside)
            case 2:
                btn.addTarget(self, action: #selector(mainScene.leftClick), for: .touchUpInside)
            case 3:
                btn.addTarget(self, action: #selector(mainScene.fireClick), for: .touchUpInside)
            case 4:
                btn.addTarget(self, action: #selector(mainScene.changeClick), for: .touchUpInside)
            default: break
                
            }
        }
        defultCubic()
        //kaishi
        addCubic()
    }
    //碰撞代理方法
    func didBegin(_ contact: SKPhysicsContact) {
       print("pengle")
        let nodeA:SKNode = contact.bodyA.node!
        let nodeB:SKNode = contact.bodyB.node!
        if nodeA.hasActions() {
            nodeA.removeAction(forKey: "other")
        }
        if nodeB.hasActions() {
            nodeB.removeAction(forKey: "our")
            addCubic()
        }
    }
    
    func defultCubic() {
        let defult:SKSpriteNode = cubicCreate.makeCubic()
        defult.position = CGPoint(x: wscreen * 0.5, y: 600);
        self.addChild(defult)
        
    }
    func addCubic() {
        if haveFinish == false {
            let cubic:SKSpriteNode = cubicCreate.makeCubic()
            cubic.position = CGPoint(x: wscreen * 0.5, y: 204.0/667.0 * hscreen)
            let runaction:SKAction = SKAction.sequence([SKAction.moveBy(x: 0, y: 1500, duration: 50)])
            cubic.run(runaction, withKey: "our")
            self.addChild(cubic)
        }
    }
    
    func leftClick() {
        print("zuo")
    }
    func rightClick() {
        print("you")
    }
    func fireClick() {
        print("jiang")
    }
    func changeClick() {
       print("bian")
    }
}

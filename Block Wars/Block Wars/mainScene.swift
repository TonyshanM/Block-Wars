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
var currentCubic:SKSpriteNode? = nil
var cubicStop:Bool = false



class mainScene: SKScene,SKPhysicsContactDelegate {

    override func didMove(to view: SKView) {
        createContent()
        self.physicsWorld.contactDelegate = self;
        //设置边界
        self.physicsBody = SKPhysicsBody.init(edgeLoopFrom: self.frame)
    }
    func createContent() {
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
        let vector:CGVector = contact.contactNormal
        
        print(vector)
        if vector.dy <= -0.99 {
            cubicStop = false
            if nodeA.hasActions() {
                nodeA.removeAction(forKey: "other")
            }
            if nodeB.hasActions() {
                nodeB.removeAction(forKey: "our")
                currentCubic = nil
                addCubic()
            }
        }else{
            cubicStop = true
        }
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        print("wanle")
        cubicStop = false
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
            currentCubic = cubic
            self.addChild(cubic)
        }
    }
    
    
    
    
    func rightClick() {
        print("you")
        if cubicStop == false {
            var temp:CGPoint = (currentCubic?.position)!
            temp.x -= 40
            currentCubic?.position = temp
        }
    }
    func leftClick() {
        print("zuo")
        if cubicStop == false {
            var temp:CGPoint = (currentCubic?.position)!
            temp.x += 40
            currentCubic?.position = temp
        }
    }
    func fireClick() {
        print("jiang")
    }
    func changeClick() {
       print("bian")
    }
    
    
    override func didSimulatePhysics() {
        self.enumerateChildNodes(withName: "cubic") { (node, stop) in
            if node.position.y < 200.0/667.0 * hscreen {
                node.removeFromParent()
            }
        }
    }
}

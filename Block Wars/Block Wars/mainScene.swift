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

class mainScene: SKScene {

    override func didMove(to view: SKView) {
        createContent()
    }
    func createContent() {
        let centerView:SKView = SKView.init()
        centerView.backgroundColor = UIColor.gray
        self.view?.addSubview(centerView)
        centerView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-20.0/667.0 * hscreen)
            make.width.equalTo(wscreen - 20.0/375.0 * wscreen)
            make.height.equalTo(hscreen - 120.0/667.0 * hscreen)
        }
        
        
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

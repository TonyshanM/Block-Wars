//
//  cubicCreate.swift
//  Block Wars
//
//  Created by 紫贝壳 on 2017/1/3.
//  Copyright © 2017年 紫贝壳. All rights reserved.
//

import UIKit
import SpriteKit
let cubicCatargy:UInt32 = 0x00000001

class cubicCreate: NSObject {
   class func makeCubic() -> SKSpriteNode {
        let cubic:SKSpriteNode = SKSpriteNode.init()
        cubic.size = CGSize(width: 40, height: 40)
        cubic.color = UIColor.yellow
        cubic.name = "cubic"
//        let temp:CGSize = CGSize(width: 39, height: 40)
//        let rectWithPoint:CGRect = cubic.centerRect
//        cubic.physicsBody = SKPhysicsBody.init(rectangleOf: temp, center: rectWithPoint.origin)
        cubic.physicsBody = SKPhysicsBody.init(rectangleOf: cubic.size)
        cubic.physicsBody?.categoryBitMask = cubicCatargy
        cubic.physicsBody?.contactTestBitMask = cubicCatargy
        cubic.physicsBody?.collisionBitMask = cubicCatargy
        cubic.physicsBody?.affectedByGravity = false
        cubic.physicsBody?.usesPreciseCollisionDetection = true
        return cubic
    }
}

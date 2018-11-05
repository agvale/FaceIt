//
//  FacialExpression.swift
//  FaceIt
//
//  Created by 有种网 on 2018/10/30.
//  Copyright © 2018 zhiang. All rights reserved.
//

import Foundation

struct FacialExpression {
    enum Eyes: Int {
        case open
        case closed
        case squinting
    }
    enum Mouth: Int {
        case frown
        case smirk
        case neutral
        case grin
        case smile
        
        var sadder: Mouth {
            return Mouth(rawValue: rawValue - 1) ?? .frown
        }
        var happier: Mouth {
            return Mouth(rawValue: rawValue + 1) ?? .smile
        }
    }
    var sadder: FacialExpression {
        return FacialExpression(eyes: self.eyes, mouth: self.mouth.sadder)
    }
    var happier: FacialExpression {
        return FacialExpression(eyes: self.eyes, mouth: self.mouth.happier)
    }
    
    let eyes: Eyes
    let mouth: Mouth
    
}

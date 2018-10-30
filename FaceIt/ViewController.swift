//
//  ViewController.swift
//  FaceIt
//
//  Created by zhiang on 2018/10/29.
//  Copyright © 2018年 zhiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var faceView: FaceView! {
        didSet {
            updateUI()
        }
    }
    
    var expression = FacialExpression(eyes: .open, mouth: .grin)
    
    private func updateUI() {
        switch expression.eyes {
        case .open:
            faceView.eyesOpen = true
        case .closed:
            faceView.eyesOpen = false
        case .squinting:
            faceView.eyesOpen = false
        }
        faceView.mouthCurvature = mouthCurvatures[expression.mouth] ?? 0.0
    }
    
    private let mouthCurvatures = [
        FacialExpression.Mouth.grin : 0.5,
        .frown : -1.0,
        .smile : 1.0,
        .neutral : 0.0,
        .smirk : -0.5
        ]
    
}


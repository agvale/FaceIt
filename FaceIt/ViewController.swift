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
            let handler = #selector(FaceView.changeScale(byReactingTo:))
            let pinchRecognizer = UIPinchGestureRecognizer(target: faceView, action: handler)
            faceView.addGestureRecognizer(pinchRecognizer)
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(toggleEyes(byReactingTo:)))
            tapRecognizer.numberOfTapsRequired = 1
            faceView.addGestureRecognizer(tapRecognizer)
            let swiperUpRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(increaseHappiness))
            swiperUpRecognizer.direction = .up
            faceView.addGestureRecognizer(swiperUpRecognizer)
            let swiperDownRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(decreaseHappiness))
            swiperDownRecognizer.direction = .down
            faceView.addGestureRecognizer(swiperDownRecognizer)
            updateUI()
        }
    }
    
    @objc func increaseHappiness() {
        expression = expression.happier
    }
    
    @objc func decreaseHappiness() {
        expression = expression.sadder
    }
    
    @objc func toggleEyes(byReactingTo tapRecognizer: UITapGestureRecognizer) {
        if tapRecognizer.state == .ended {
            let eyes: FacialExpression.Eyes = (expression.eyes == .closed) ? .open : .closed
            expression = FacialExpression(eyes: eyes, mouth: expression.mouth)
        }
    }
    
    var expression = FacialExpression(eyes: .closed, mouth: .frown) {didSet{updateUI()}}
    
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


//
//  AnimationsViewController.swift
//  Gestures&Animations
//
//  Created by Sanjay Shah on 2018-08-06.
//  Copyright © 2018 Sanjay Shah. All rights reserved.
//

import UIKit

class AnimationsViewController: UIViewController {
    
    
    @IBOutlet weak var box: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
    
    
    @IBAction func animateAction(_ sender: UIButton) {
    
        //viewAnimationWithNoCompletionBlock()
        //viewAnimationWithCompletionBlock()
        //coreAnimationColorChange
        //coreAnimationKeyframeXPosChange()
        //coreAnimationKeyframeFullPosChange()
    }
    
    //ViewAnimations
    
    //changing the transaprency, and rotating
    func viewAnimationWithNoCompletionBlock(){
        
        UIView.animate(withDuration: 3, animations: {

            //alpha is transparency
            self.box.alpha = 0.3
            
            self.box.transform = CGAffineTransform(rotationAngle: 90)
            })
    }
    
    
    //changing the transaprency, and rotating, and making the final appearance have a black background
    func viewAnimationWithCompletionBlock(){
        
        UIView.animate(withDuration: 3, animations: {
            
            self.box.alpha = 0.3
            self.box.transform = CGAffineTransform(rotationAngle: 90)
            
        }, completion: {(bool) in
            
            self.box.backgroundColor = .black
            
        })
    }
    
    
    
    //CoreAnimations
    
    //basic color change
    func coreAnimationColorChange(){
        
        //a list of these key paths can be found in the Apple Core Animation documentation
        let animation = CABasicAnimation(keyPath: "backgroundColor")
        
        animation.fromValue = UIColor.red.cgColor
        animation.toValue = UIColor.blue.cgColor
        
        box.layer.add(animation, forKey: "colorChange")
        
    }
    
    
    //keyframe CoreAnimations
    
    //making the box go left to right and vice versa a couple of times
    func coreAnimationKeyframeXPosChange(){
    
        let myKeyFrameAnim = CAKeyframeAnimation(keyPath: "position.x")
        
        //need to specify time
        myKeyFrameAnim.duration = 1

        //need to specify key times and X values (CGFloats) for those times
        myKeyFrameAnim.keyTimes = [0, 0.3, 0.5, 0.9, 2.5, 2.8, 3]
        myKeyFrameAnim.values = [0, -30, 30, -30, 30, -30, 20]

        //how many times you want animation to repeat
        myKeyFrameAnim.repeatCount = 2
        
        //relative positoning based on current render
        myKeyFrameAnim.isAdditive = true
        
        //absolute positoioning. If not specified, default is false
        //myKeyFrameAnim = false
    
        //relative to end of previous cycle. Only use this property if you have a repetition.
        myKeyFrameAnim.isCumulative = true
        
        //absolute positioning.If not specified, default is false
        //myKeyFrameAnim.isCumulative = false
        
        //this key can be anything we want. Need to remember it if we want to refer back to the animation later.
        box.layer.add(myKeyFrameAnim, forKey: "totalAnim")
        
    }
    
    //keyframe CoreAnimations changing x and y position
    func coreAnimationKeyframeFullPosChange(){
        
        let myX = CAKeyframeAnimation(keyPath: "position")
        
        //position is a combination of x and y. Also known as CGPoint. So our values need to be CGPoints
        myX.keyTimes = [0, 0.9, 2.5, 3]
        myX.values = [CGPoint(x: 0, y: 20), CGPoint(x: 20, y: 20), CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 20) ]
        
        myX.repeatCount = 2
        
        //relative positoning based on current render
        myX.isAdditive = true
        
        //relative to the end of previous cycle
        myX.isCumulative = true
 
        box.layer.add(myX, forKey: "totalAnim")
        
    }
    
}

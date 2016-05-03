//
//  FallingSnowViewController.swift
//  Dynamics Demo
//
//  Created by Corwin Crownover on 4/14/16.
//  Copyright © 2016 Corwin Crownover. All rights reserved.
//

import UIKit

class FallingSnowViewController: UIViewController {
    
    // OUTLETS
    @IBOutlet weak var snowView: UIView!
    
    var snow: UIView!
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    
    
    // VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        animator = UIDynamicAnimator(referenceView: self.view)
        
        gravity = UIGravityBehavior()
//        gravity.gravityDirection = CGVectorMake(0, 1.1)
        
        collision = UICollisionBehavior()
        collision.translatesReferenceBoundsIntoBoundary = true
        collision.addBoundaryWithIdentifier("shelf", fromPoint: CGPointMake(0, 200), toPoint: CGPointMake(150,240))
        
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        
        let timer = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: "onTimer", userInfo: nil, repeats: true)
        timer.fire()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    // FUNCTIONS
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    func onTimer() {
        snow = UIView(frame: CGRect(x: Int(arc4random_uniform(368)), y: 0, width: 5, height: 5))
        snow.backgroundColor = UIColor(white: 1, alpha: 1)
        view.addSubview(snow)
        print("\(snow.center.x)")
        
        gravity.addItem(snow)
        collision.addItem(snow)
        
        snow.center.y -= 10
        
        delay(2) {
            self.snow.alpha = 0
            self.gravity.removeItem(self.snow)
            self.collision.removeItem(self.snow)
            self.snow.removeFromSuperview()
        }
    }
    
    //    func meltSnow() {
    //        snow.alpha = 0
    //        gravity.removeItem(snow)
    //        collision.removeItem(snow)
    //        snow.removeFromSuperview()
    //    }

    


    
    

}


// TODO
// make snow melt

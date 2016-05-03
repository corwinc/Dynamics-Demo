//
//  SpaceshipViewController.swift
//  Dynamics Demo
//
//  Created by Corwin Crownover on 4/15/16.
//  Copyright © 2016 Corwin Crownover. All rights reserved.
//

import UIKit

class SpaceshipViewController: UIViewController {
    
    // OUTLETS
    var spaceship: UIImageView!
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var push: UIPushBehavior!
    var collision: UICollisionBehavior!
    
    
    
    // VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator = UIDynamicAnimator(referenceView: self.view)
        
        gravity = UIGravityBehavior()
        gravity.gravityDirection = CGVectorMake(0, 0.4)
        
        collision = UICollisionBehavior()
        
        push = UIPushBehavior()
        
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        animator.addBehavior(push)
        
        let timer = NSTimer.scheduledTimerWithTimeInterval(2.5, target: self, selector: "onTimer", userInfo: nil, repeats: true)
        timer.fire()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    
    // FUNCTIONS
    func onTimer() {
        let spaceshipImage = UIImage(named: "spaceship")
        spaceship = UIImageView(image: spaceshipImage)
        view.addSubview(spaceship)
        spaceship.center = CGPointMake(200, 0)
        spaceship.center.y -= 50
        
        gravity.addItem(spaceship)
        collision.addItem(spaceship)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.locationInView(view)
            print(position)
        }
    }
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        let point = sender.locationInView(view)
        let bullet = UIView(frame: CGRect(origin: point, size: (5, 5)))
        view.addSubview(bullet)
    }
    
    
    

}

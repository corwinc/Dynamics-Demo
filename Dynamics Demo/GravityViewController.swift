//
//  GravityViewController.swift
//  Dynamics Demo
//
//  Created by Corwin Crownover on 4/14/16.
//  Copyright © 2016 Corwin Crownover. All rights reserved.
//

import UIKit

class GravityViewController: UIViewController {
    
    // OUTLETS
    @IBOutlet weak var block: UIView!
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    
    

    // VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        animator = UIDynamicAnimator(referenceView: self.view)
        gravity = UIGravityBehavior()
        animator.addBehavior(gravity)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // FUNCTIONS
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        gravity.addItem(block)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

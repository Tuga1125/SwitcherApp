//
//  SwitchingViewController.swift
//  SwitcherApp
//
//  Created by Tooga Garanja Magar on 2023-10-04.
//

import UIKit

class SwitchingViewController: UIViewController {
    
    var blueViewController: BlueViewController?
    var yellowViewController: YellowViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create and initialize your view controllers here
        blueViewController = storyboard?.instantiateViewController(withIdentifier: "Blue") as? BlueViewController
        yellowViewController = storyboard?.instantiateViewController(withIdentifier: "Yellow") as? YellowViewController
        
        // Ensure that both view controllers have their views set up
        blueViewController?.view.frame = view.frame
        yellowViewController?.view.frame = view.frame
    }
    
//    @IBAction func switchViews(sender: UIBarButtonItem) {
//        // Check if the blue view is currently displayed
//        if blueViewController?.view.superview != nil {
//            // Switch to the yellow view
//            switchViewController(from: blueViewController, to: yellowViewController)
//        } else {
//            // Switch to the blue view
//            switchViewController(from: yellowViewController, to: blueViewController)
//        }
//    }
    
    func switchViewController(from: UIViewController?, to: UIViewController?) {
        if from == nil || to == nil {
            return
        }
        
        // Remove the current view controller
        from!.willMove(toParent: nil)
        from!.view.removeFromSuperview()
        from!.removeFromParent()
        
        // Add the new view controller
        addChild(to!)
        view.addSubview(to!.view)
        to!.didMove(toParent: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        if blueViewController != nil
            && blueViewController!.view.superview == nil {
            blueViewController = nil
        }
        if yellowViewController != nil
            && yellowViewController!.view.superview == nil {
            yellowViewController = nil
        }
    }
    
    @IBAction func switchViews(sender: UIBarButtonItem) {
        // Create the new view controller, if required
        if yellowViewController?.view.superview == nil {
            if yellowViewController == nil {
                yellowViewController =
                storyboard?.instantiateViewController(withIdentifier: "Yellow")
                as? YellowViewController
            }
        } else if blueViewController?.view.superview == nil {
            if blueViewController == nil {
                blueViewController =
                storyboard?.instantiateViewController(withIdentifier: "Blue")
                as? BlueViewController
            }
        }
        
        UIView.transition(with: view, duration: 0.4, options: .transitionFlipFromRight, animations: {
            if self.blueViewController != nil && self.blueViewController!.view.superview != nil {
                self.yellowViewController?.view.frame = self.view.frame
                self.switchViewController(from: self.blueViewController, to: self.yellowViewController)
            } else {
                self.blueViewController?.view.frame = self.view.frame
                self.switchViewController(from: self.yellowViewController, to: self.blueViewController)
            }
        }, completion: nil)
        
    }
}

//
//  BlueViewController.swift
//  SwitcherApp
//
//  Created by Tooga Garanja Magar on 2023-10-04.
//

import UIKit

class BlueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func blueButtonPressed(sender: UIButton) {
            let alert = UIAlertController(title: "Blue View Button Pressed",
                                          message: "You pressed the button on the blue view",
                                          preferredStyle: .alert)
            let action = UIAlertAction(title: "Yes, I did", style: .default,
                                       handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    

}

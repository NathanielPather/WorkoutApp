//
//  AddWorkoutViewController.swift
//  WorkoutApp
//
//  Created by Nathaniel Pather on 23/11/18.
//  Copyright © 2018 Nathaniel Pather. All rights reserved.
//

import UIKit

class AddWorkoutViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var setsLabel: UILabel!
    
    /* Why do actions need outlets? This method doesn't work when stepper outlet
 is commented out */
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        setsLabel.text = Int(sender.value).description
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

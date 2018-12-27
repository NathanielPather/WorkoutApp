//
//  DetailViewController.swift
//  WorkoutApp
//
//  Created by Nathaniel Pather on 27/12/18.
//  Copyright © 2018 Nathaniel Pather. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var repsLabel: UILabel!
    
    var passedValue: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Passed Value is: \(passedValue)")
        // Do any additional setup after loading the view.
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

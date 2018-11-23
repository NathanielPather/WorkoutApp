//
//  AddWorkoutViewController.swift
//  WorkoutApp
//
//  Created by Nathaniel Pather on 23/11/18.
//  Copyright © 2018 Nathaniel Pather. All rights reserved.
//

import UIKit

class AddWorkoutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var setsLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var setsVal: Int = 0
    
    /* Why do actions need outlets? This method doesn't work when stepper outlet
 is commented out */
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        setsVal = Int(sender.value)
        setsLabel.text = setsVal.description
        tableView.reloadData()
    }
    
    /*
     For tableview to work, the tableviews datasource and delegate needs to be specified. Control drag the tableview in the storyboard to the yellow circle for view controller that is responsible for it. Select both datasource and delegate.
     
     Inside the view controller, the view controller needs to conform to both UITableViewDataSource and UITableViewDelegate, add these, seperated by "," next to the classes type.
     
     Then implement the methods numberOfSections, numberOfRows, and cellForRow
 */
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setsVal
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Cell Text"
        return cell
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

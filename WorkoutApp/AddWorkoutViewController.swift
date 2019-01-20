//
//  AddWorkoutViewController.swift
//  WorkoutApp
//
//  Created by Nathaniel Pather on 23/11/18.
//  Copyright © 2018 Nathaniel Pather. All rights reserved.
//

import UIKit
import CoreData

class RepsTableViewCell : UITableViewCell {
    @IBOutlet weak var repsNoLabel: UILabel!
    @IBOutlet weak var repsStepper: UIStepper!
    
}

class AddWorkoutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setsLabel.text = setsVal.description
        fetch()
        
        // Do any additional setup after loading the view.
        
    }
    
    @IBOutlet weak var workoutName: UITextField!
    @IBOutlet weak var setsStepper: UIStepper!
    @IBOutlet weak var setsLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var setsVal: Int = 1
    
    /* Why do actions need outlets? This method doesn't work when stepper outlet
 is commented out */
    
    /* When stepperValue is changed, the tableView needs to reload because the rows are dependent on steppers value */
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        setsVal = Int(sender.value)
        setsLabel.text = setsVal.description
        tableView.reloadData()
    }
    
    @IBAction func repsStepperValueChanged(_ sender: UIStepper) {
        tableView.reloadData()
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        if (workoutName.text! == "") {
            let alert = UIAlertController(title: "Error", message: "Please enter a name for the workout!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: { action in
                switch action.style {
                case .default:
                    print("default")
                case .destructive:
                    print("destructive")
                case .cancel:
                    print("cancel")
                }
            }))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            print("save")
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
            }
            let context = appDelegate.persistentContainer.viewContext
            let workout = Workout(context: context)
            workout.name = workoutName.text
            workout.noOfSets = Int16(setsStepper.value)
            
            var no = 1
            for index in 1..<setsVal {
                let sets = Sets(context: context)
                let test = IndexPath(row: index, section: 0)
                let cell = tableView.cellForRow(at: test) as! RepsTableViewCell
                sets.repAmount = Int16(cell.repsStepper.value)
                sets.noId = Int16(no)
                workout.addToSets(sets)
                no = no + 1
            }
            try! context.save()
            no = 1
            dismiss(animated: true, completion: nil)
        }
    }
    
    /* Full Fetching of Data */
    /* Unused, exists as example */
    func fetch() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Workout")
        
        do {
            let result = try context.fetch(request)
            for index in result as! [Workout] {
                print(index.value(forKey: "name") as! String)
                print("Number of Sets: \(index.value(forKey: "noOfSets") as! Int16)")
                
                let sets = index.sets as! Set<Sets>
                let sortedSets = sets.sorted(by: { $0.noId < $1.noId })
                
                for set in sortedSets {
                    print("setNo: \(set.noId) reps: \(set.repAmount)")
                }
            }
        }
        catch {
            print("failed")
        }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepsCell", for: indexPath) as! RepsTableViewCell
        cell.repsNoLabel.text = Int(cell.repsStepper.value).description
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

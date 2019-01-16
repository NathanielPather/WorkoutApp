//
//  DetailViewController.swift
//  WorkoutApp
//
//  Created by Nathaniel Pather on 27/12/18.
//  Copyright © 2018 Nathaniel Pather. All rights reserved.
//

/*
 To Do
 Make all done buttons disabled - Done
 Make all but first button disabled - Done
 Make buttons enabled over each click - Done
 Make previous butons disabled over each click - Done
 Pop up view on competed workout - Done
 Exit view after completed workout - Done
 */

import UIKit
import CoreData

var completedSets = 0

class SetTableViewCell: UITableViewCell {
    @IBOutlet weak var repsLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
}

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setsAmount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRow Executed")
        let cell = tableView.dequeueReusableCell(withIdentifier: "setCell") as! SetTableViewCell
        cell.repsLabel.text = fetchRepAmount(indexPath: indexPath.row).description
        print("row is: \(indexPath.row)")
        if(completedSets == indexPath.row) {
            cell.doneButton.isEnabled = true
        }
        else {
            cell.doneButton.isEnabled = false
        }
        return cell
    }
    
    func fetchRepAmount(indexPath: Int) -> Int {
        let x = indexPath
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate!.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Workout")
        var result: [Workout]
        var currentSet: Int16 = 0
        do {
            result = try context.fetch(request) as! [Workout]
            let sets = result[passedIndexPath.row].sets as! Set<Sets>
            for set in sets {
                if(set.noId-1 == x) {
                    currentSet = set.repAmount
                }
            }
            return Int(currentSet)
        }
        catch {
            print("failed")
        }
        return Int(currentSet)
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var workoutTableView: UITableView!
    
    @IBAction func completeSet(_ sender: Any) {
        print("completedSets = \(completedSets)")
        completedSets = completedSets + 1
        workoutTableView.reloadData()
        
        if (completedSets == setsAmount) {
            let alert = UIAlertController(title: "Congratulations!", message: "You've completed your workout!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style {
                case .default:
                    print("default")
                    completedSets = 0
                    self.dismiss(animated: true, completion: nil)
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                }
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func quitButton(_ sender: Any) {
        completedSets = 0
        dismiss(animated: true, completion: nil)
    }
    
    var passedValue: String!
    var setsAmount: Int!
    var passedIndexPath: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = passedValue
        print(setsAmount)
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

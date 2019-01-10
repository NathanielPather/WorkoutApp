//
//  DetailViewController.swift
//  WorkoutApp
//
//  Created by Nathaniel Pather on 27/12/18.
//  Copyright © 2018 Nathaniel Pather. All rights reserved.
//

/*
 To Do
 Fetch rep amounts for specific sets and assign them to rep associated rep labels.
 */

import UIKit
import CoreData

class SetTableViewCell: UITableViewCell {
    @IBOutlet weak var repsLabel: UILabel!
}

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setsAmount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "setCell") as! SetTableViewCell
        cell.repsLabel.text = fetchRepAmount(indexPath: indexPath.row).description
        print("row is: \(indexPath.row)")
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
    
    @IBAction func quitButton(_ sender: Any) {
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

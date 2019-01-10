//
//  DetailViewController.swift
//  WorkoutApp
//
//  Created by Nathaniel Pather on 27/12/18.
//  Copyright © 2018 Nathaniel Pather. All rights reserved.
//

/*
 To Do
 Quit button closes view and goes back to ViewController.swift view.
 Fetch rep amounts for specific sets and assign them to rep associated rep labels.
 */

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setsAmount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "setCell")
        return cell!
    }
    
    
    @IBOutlet weak var repsLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func quitButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    var passedValue: String!
    var setsAmount: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = passedValue
        print(setsAmount)
        // Do any additional setup after loading the view.
        
        /* number of rows = number of sets */
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

//
//  ViewController.swift
//  WorkoutApp
//
//  Created by Nathaniel Pather on 22/11/18.
//  Copyright © 2018 Nathaniel Pather. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchCount()
    }
    
    func fetchCount() -> Int {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate!.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Workout")
        var result: [Any] = [1]
        do {
            result = try context.fetch(request)
        }
        catch {
            print("failed")
        }
        return result.count
    }
    
    func fetchName(indexPath: Int) -> String {
        let x = indexPath
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate!.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Workout")
        var result: [Workout]
        do {
            result = try context.fetch(request) as! [Workout]
            return(result[x].name!)
        }
        catch {
            print("failed")
        }
        return "noNames"
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "col", for: indexPath as IndexPath) as! MyCollectionViewCell
        cell.backgroundColor = UIColor.cyan
        cell.cellNameTextLabel.text = fetchName(indexPath: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item selected")
    }
    
    @IBAction func addWorkout(_ sender: UIBarButtonItem) {
        print("test")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}


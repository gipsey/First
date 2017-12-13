//
//  MealTableViewController.swift
//  First
//
//  Created by David Debre on 12/11/17.
//  Copyright © 2017 David Debre. All rights reserved.
//

import UIKit
import os.log

class MealTableViewController: UITableViewController {
    
    let cellIdentifier = "MealTableViewCell"
    var meals = [Meal]()
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? MealViewController,
            let meal = sourceViewController.meal {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                meals[selectedIndexPath.row] = meal
                tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
            }
            else {
                let newIndexPath = IndexPath(row: meals.count, section: 0)
                meals.append(meal)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            
            saveMeals()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         navigationItem.leftBarButtonItem = editButtonItem
        
        if let savedMeals = loadMeals() {
            meals = savedMeals
        } else {
            loadDate()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MealTableViewCell
            else {
                fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        let meal = meals[indexPath.row]
        
        cell.label.text = meal.name
        cell.photoImageView.image = meal.image
        cell.ratingBar.rating = meal.rating
        
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            meals.remove(at: indexPath.row)
            saveMeals()
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        switch (segue.identifier ?? "") {
        case "ShowDetail":
            NSLog("NSLog ShowDetail")
            os_log("ShowDetail", log: OSLog.default, type: .debug)
            
            let mealViewController = segue.destination as? MealViewController
            let selectedCell = sender as! MealTableViewCell
            let selectedIndexPath = tableView.indexPath(for: selectedCell)
            
            mealViewController?.meal = meals[selectedIndexPath!.row]
        case "AddItem":
            NSLog("NSLog AddItem")
            os_log("Adding a new meal.", log: OSLog.default, type: .debug)
        default:
            NSLog("NSLog prepare - switch - something went wrong")
            os_log("prepare - switch - something went wrong")
            
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }
    
    private func saveMeals() {
        let url = Meal.ArchiveURL.path
        let isSuccess = NSKeyedArchiver.archiveRootObject(meals, toFile: url)
        
        if isSuccess {
            os_log("Meals successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save meals...", log: OSLog.default, type: .error)
        }
    }
    
    private func loadMeals() -> [Meal]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Meal.ArchiveURL.path) as? [Meal]
    }
    
    private func loadDate() {
        let m1 = UIImage(named: "m1")
        guard let meal1 = Meal("Caprese Salad", m1, 4) else {
            fatalError("Unable to instantiate meal1")
        }
        
        let m2 = UIImage(named: "m2")
        guard let meal2 = Meal("Chicken and Potatoes", m2, 5) else {
            fatalError("Unable to instantiate meal2")
        }
        
        let m3 = UIImage(named: "m3")
        guard let meal3 = Meal("Pasta with Meatballs", m3, 3) else {
            fatalError("Unable to instantiate meal2")
        }
        
        meals += [meal1, meal2, meal3]
    }
}

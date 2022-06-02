//
//  ChickenTableViewController.swift
//  ChickenHouse
//
//  Created by Ludovic Ollagnier on 01/06/2022.
//

import UIKit

class ChickenTableViewController: UITableViewController {

    let chickenHouse = ChickenHouse()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "My Chicken House"

        let myChicken = Chicken(id: nil,
                                name: "Poule1",
                                birthDate: Date(),
                                breed: .other(name: "HumanCoderix"))

        let myChicken2 = Chicken(id: "12R-87U-986",
                                name: "Poule2",
                                birthDate: Date(),
                                breed: .other(name: "HumanCoderix"))

        chickenHouse.add(myChicken)
        chickenHouse.add(myChicken2)

        // Register an obeserver for the notification
        let notCenter = NotificationCenter.default
        notCenter.addObserver(forName: Notification.Name("chickenAdded"), object: chickenHouse, queue: nil) { myNotif in
            if let chicken = myNotif.userInfo?["chickenAdded"] as? Chicken {
                print("A chicken was added \(chicken.name)")
            }
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chickenHouse.list().count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let chicken = chickenHouse.list()[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "chickenCell", for: indexPath)

        var content = cell.defaultContentConfiguration()
        content.text = chicken.name
        content.secondaryText = chicken.id

        cell.contentConfiguration = content

        return cell
    }
    


    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let chicken = chickenHouse.list()[indexPath.row]
            chickenHouse.cook(chicken)

            tableView.deleteRows(at: [indexPath], with: .fade) // Handle animation

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.

        if segue.identifier == "showDetails" {
            let chickenDetails = segue.destination as? ChickenDetailsViewController

            // Identify the chicken (two ways to do this)
            let indexPath = tableView.indexPathForSelectedRow

            guard let cell = sender as? UITableViewCell, let indexPathFromCell = tableView.indexPath(for: cell) else { return }
            let chicken = chickenHouse.list()[indexPathFromCell.row]

            // Pass the chicken
            chickenDetails?.chicken = chicken

        } else if segue.identifier == "showForm" {
            // We go to the form view
            let form = segue.destination as? ViewController
            form?.chickenHouse = self.chickenHouse
        }
    }

}

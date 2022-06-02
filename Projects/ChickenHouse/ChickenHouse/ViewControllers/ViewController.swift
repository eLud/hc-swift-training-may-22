//
//  ViewController.swift
//  ChickenHouse
//
//  Created by Ludovic Ollagnier on 31/05/2022.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var validateButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var activityIndicator: UILabel!
    @IBOutlet weak var middleStackView: UIStackView!
    @IBOutlet weak var demoSwitch: UISwitch!

    @IBOutlet weak var tableView: UITableView!

    var chickenHouse: ChickenHouse?

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        validateButton.tintColor = .red
        setUpTableView()
    }

    func setUpTableView() {

        self.tableView.dataSource = self
    }

    //MARK: - Actions
    @IBAction func sayHello(_ sender: UIButton) {

        nameLabel.text = nameTextField.text
//        sender.isEnabled = false

        sender.setTitle("Say Hello To User", for: .normal)

        demoSwitch.isHidden.toggle()

//        middleStackView.isHidden = true

        if bottomConstraint.constant == -200 {
            bottomConstraint.constant  = 0
        } else {
            bottomConstraint.constant  = -200
        }

        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }

        middleStackView.setCustomSpacing(50.0, after: activityIndicator)

        let randomChicken = Chicken(id: UUID().uuidString, name: "Poule \(Int.random(in: 0...100000))", birthDate: Date(), breed: .australorp)
        chickenHouse?.add(randomChicken)
    }

}

//MARK: - DataSource
extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 5
        case 1:
            return 3
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "demoCell", for: indexPath)

        var content = cell.defaultContentConfiguration()

        content.text = "Line \(indexPath.row)"
        content.image = UIImage(systemName: "leaf")

        cell.contentConfiguration = content

        if indexPath.row.isMultiple(of: 2) {
            cell.backgroundColor = .red
        } else {
            cell.backgroundColor = .clear
        }

        return cell
    }
}


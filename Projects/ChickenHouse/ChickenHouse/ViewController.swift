//
//  ViewController.swift
//  ChickenHouse
//
//  Created by Ludovic Ollagnier on 31/05/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var validateButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        nameLabel.text = "toto"
        nameLabel.textColor = UIColor.green

        validateButton.tintColor = .red
    }

    @IBAction func sayHello(_ sender: UIButton) {

        nameLabel.text = nameTextField.text
        sender.isEnabled = false
    }

}


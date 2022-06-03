//
//  ChickenDetailsViewController.swift
//  ChickenHouse
//
//  Created by Ludovic Ollagnier on 01/06/2022.
//

import UIKit
import SwiftUI

class ChickenDetailsViewController: UIViewController {

    var chicken: Chicken?

    @IBOutlet weak var chickenNameLabel: UILabel!

    @IBOutlet weak var pickerView: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()

        chickenNameLabel.text = chicken?.name
        title = chicken?.name

        pickerView.delegate = self
        pickerView.dataSource = self

        //UIViewControllerRepresentable to create a SwiftUI view from a UIKit ViewController
        let profile = UIHostingController(rootView: ChickenProfileImage(chicken: chicken!))
        present(profile, animated: true, completion: nil)
    }

}

extension ChickenDetailsViewController: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "Row \(row) in \(component)"
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Did Select \(row) in \(component)")
    }

}

extension ChickenDetailsViewController: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        5
    }
}

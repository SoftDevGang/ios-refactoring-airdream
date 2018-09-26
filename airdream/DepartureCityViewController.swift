//
//  DepartureCityViewController.swift
//  airdream
//
//  Created by Bastien DAVID on 26/09/2018.
//  Copyright © 2018 Orange. All rights reserved.
//

import UIKit

class DepartureCityViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var departureCity: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        departureCity.delegate = self
    }

    @IBAction func onNext(_ sender: UIButton) {
        let wizard = navigationController as! BookingWizardNavigationViewController
        wizard.departureCity = departureCity.text!

        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let arrivalCityViewController: ArrivalCityViewController = storyboard.instantiateViewController(withIdentifier: "ArrivalCityViewController") as! ArrivalCityViewController
        navigationController?.pushViewController(arrivalCityViewController, animated: true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

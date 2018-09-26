//
//  ArrivalCityViewController.swift
//  airdream
//
//  Created by Bastien DAVID on 26/09/2018.
//  Copyright © 2018 Orange. All rights reserved.
//

import UIKit

class ArrivalCityViewController : UIViewController, UITextFieldDelegate {

    @IBOutlet weak var arrivalCity: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrivalCity.delegate = self
    }

    @IBAction func onNext(_ sender: UIButton) {
        let wizard = navigationController as! BookingWizardNavigationViewController
        wizard.arrivalCity = arrivalCity.text!

        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let bookingConfirmationViewController: BookingConfirmationViewController = storyboard.instantiateViewController(withIdentifier: "BookingConfirmationViewController") as! BookingConfirmationViewController
        navigationController?.pushViewController(bookingConfirmationViewController, animated: true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

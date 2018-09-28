//
//  TripTypeViewController.swift
//  airdream
//
//  Created by Bastien DAVID on 26/09/2018.
//  Copyright © 2018 Orange. All rights reserved.
//

import UIKit

class TripTypeViewController: UIViewController, UITextFieldDelegate, BookingAccumulator {
    var runStep: ((WizardStep) -> ())?
    var bookingData: BookingData?
    var wizard: Wizard?
    

    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var tripType: UISwitch!
    @IBOutlet weak var departureCity: UITextField!
    @IBOutlet weak var arrivalCity: UITextField!
    
    override func viewDidLoad() {
        departureCity.delegate = self
        arrivalCity.delegate = self
        
        errorMessage.isHidden = true
    }

    @IBAction func onNext(_ sender: UIButton) {

        if let data = bookingData {
            data.tripType = tripType.isOn ? 2 : 1
            data.departureCity = departureCity.text!
            data.arrivalCity = arrivalCity.text!
        }
        
        runStep?(.Confirmation)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    @IBAction func onDepartureCityUpdated(_ sender: UITextField) {
        
        if CityValidator().validate(city: sender.text!) {
            errorMessage.isHidden = true
        } else {
            errorMessage.isHidden = false
            errorMessage.text = "Unknown city"
        }
    }
}

class CityValidator {
    func validate(city: String) -> Bool {
        return city == "Grenoble"
    }
}

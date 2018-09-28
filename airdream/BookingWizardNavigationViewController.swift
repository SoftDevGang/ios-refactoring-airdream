//
//  BookingWizardNavigationViewController.swift
//  airdream
//
//  Created by Bastien DAVID on 26/09/2018.
//  Copyright © 2018 Orange. All rights reserved.
//

import UIKit

class BookingWizardNavigationViewController: UINavigationController, UIDriver {
    
    var wizard: Wizard!

    override func viewDidLoad() {
        wizard = Wizard(self)
        wizard.runStep(.TripType)
    }
    
    func tripType(_ bookingData: BookingData) {
        step("TripTypeViewController", bookingData)
    }
    
    func confimation(_ bookingData: BookingData) {
        step("BookingConfirmationViewController", bookingData)
    }
    
    func step(_ step: String, _ bookingData: BookingData) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var viewController = storyboard.instantiateViewController(withIdentifier: step) as! BookingAccumulator
        viewController.bookingData = bookingData
        viewController.runStep = { step in
            self.wizard.runStep(step)
        }
        pushViewController(viewController as! UIViewController, animated: true)
    }
}

class Wizard {
    
    let uiDriver: UIDriver
    let bookingData = BookingData()
    
    init(_ uiDriver: UIDriver) {
        self.uiDriver = uiDriver
    }
    
    func runStep(_ step: WizardStep) {
        switch step {
        case .TripType :
            uiDriver.tripType(bookingData)
        case .Confirmation:
            uiDriver.confimation(bookingData)
        }
    }
}

protocol BookingAccumulator {
    var bookingData: BookingData? { get set }
    var runStep: ((WizardStep) -> ())? { get set }
}

protocol UIDriver {
    func tripType(_ bookingData: BookingData)
    func confimation(_ bookingData: BookingData)
}

enum WizardStep {
    case TripType, Confirmation
}

class BookingData {
    
    var tripType: Int = 1
    var departureCity: String = ""
    var arrivalCity: String = ""

}

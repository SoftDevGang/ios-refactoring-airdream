//
//  TripTypeViewController.swift
//  airdream
//
//  Created by Bastien DAVID on 26/09/2018.
//  Copyright © 2018 Orange. All rights reserved.
//

import UIKit

class TripTypeViewController: UIViewController {

    @IBOutlet weak var tripType: UISwitch!

    @IBAction func onNext(_ sender: UIButton) {

        let wizard = navigationController as! BookingWizardNavigationViewController
        wizard.tripType = tripType.isOn ? 2 : 1

        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let departureCityViewController: DepartureCityViewController = storyboard.instantiateViewController(withIdentifier: "DepartureCityViewController") as! DepartureCityViewController
        navigationController?.pushViewController(departureCityViewController, animated: true)
    }
}

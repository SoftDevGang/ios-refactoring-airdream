//
//  BookingConfirmationViewController.swift
//  airdream
//
//  Created by Bastien DAVID on 26/09/2018.
//  Copyright © 2018 Orange. All rights reserved.
//

import UIKit

class BookingConfirmationViewController : UIViewController {
    
    @IBOutlet weak var summary: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let wizard = navigationController as! BookingWizardNavigationViewController
        let tripType = wizard.tripType == 1 ? "One way trip" : "Round trip"
        summary.text = "\(tripType) from \(wizard.departureCity) to \(wizard.arrivalCity)"
    }
}

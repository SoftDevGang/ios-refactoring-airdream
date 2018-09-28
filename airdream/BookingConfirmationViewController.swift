//
//  BookingConfirmationViewController.swift
//  airdream
//
//  Created by Bastien DAVID on 26/09/2018.
//  Copyright © 2018 Orange. All rights reserved.
//

import UIKit

class BookingConfirmationViewController : UIViewController, BookingAccumulator {
    var runStep: ((WizardStep) -> ())?
    
    var bookingData: BookingData?
    
    @IBOutlet weak var summary: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tripType = bookingData!.tripType == 1 ? "One way trip" : "Round trip"
        summary.text = "\(tripType) from \(bookingData!.departureCity) to \(bookingData!.arrivalCity)"
    }
}

//
//  ViewController.swift
//  Twitter-Sentiment
//
//  Created by Sreenivas k on 13/05/21.
//

import UIKit
import CoreML
import SwifteriOS

class ViewController: UIViewController {
    
    let swifter = Swifter(consumerKey: "_your_key_here", consumerSecret: "_your_secret_here_")
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBOutlet weak var emoji: UILabel!
    
   
    @IBOutlet weak var prediction: UILabel!
    @IBAction func enterField(_ sender: UITextField) {
        
    }
}


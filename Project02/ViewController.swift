//
//  ViewController.swift
//  Project02
//
//  Created by Zbigniew Pietras on 22/02/2019.
//  Copyright © 2019 Zbigniew Pietras. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // buttons setup
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor

        askQuestion()
        
        
    }
    
    
    func askQuestion() {
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button1.setImage(UIImage(named: countries[1]), for: .normal)
        button1.setImage(UIImage(named: countries[2]), for: .normal)

    }


}


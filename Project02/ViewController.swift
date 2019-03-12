//
//  ViewController.swift
//  Project06a
//
//  Created by Zbigniew Pietras on 22/02/2019.
//  Copyright © 2019 Zbigniew Pietras. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var nextRoundButton: UIButton!
    @IBOutlet var countryName: UILabel!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var round = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
//        UIBarButtonItem(UIImage(named: "someImage.png").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleClick))
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Round", style: .plain, target: self, action: #selector(showRound))
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "scoring"), style: .plain, target: self, action: #selector(showCurrentScore))
        
//        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showRound))
        let currentScore = UIBarButtonItem(title: "Score", style: .plain, target: self, action: #selector(showCurrentScore))
        
        navigationItem.rightBarButtonItems = [currentScore]
        
        askQuestion(action: nil)
    }
    
//    1. Try showing the player’s score in the navigation bar, alongside the flag to guess.
//    2. Keep track of how many questions have been asked, and show one final alert controller after they have answered 10. This should show their final score.
//    3. When someone chooses the wrong flag, tell them their mistake in your alert message – something like “Wrong! That’s the flag of France,” for example.
//    4. Add rounded corners
    
    
    func askQuestion(action: UIAlertAction!) {
        
        button1.isEnabled = true
        button2.isEnabled = true
        button3.isEnabled = true

        nextRoundButton.isHidden = true

        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        countryName.text = "\(countries[correctAnswer].uppercased())?"
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "Round \(round) from 10"
    }
    
    @objc func showRound() {
        
    }
    
    @objc func showCurrentScore() {
        
        let ac = UIAlertController(title: "Current Score", message: "Your current score is \(score) from \(round - 1)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(ac, animated: true)
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title: String
        
        if sender.tag == correctAnswer {
            sender.pulsate()
            title = "Correct"
            score += 1
        } else {
            sender.shake()
            title = "Wrong"
            score -= 1
        }
        
        round += 1
        
        if round == 11 {
            let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Play again", style: .default, handler: askQuestion))
            score = 0
            round = 1
            present(ac, animated: true)
        } else {
            button1.isEnabled = false
            button1.adjustsImageWhenDisabled = false
            button2.isEnabled = false
            button2.adjustsImageWhenDisabled = false
            button3.isEnabled = false
            button3.adjustsImageWhenDisabled = false

            nextRoundButton.isHidden = false
        }
    }
    
    @IBAction func nextRoundTapped(_ sender: UIButton) {
        askQuestion(action: nil)
    }
}


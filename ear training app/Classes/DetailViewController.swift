//
//  DetailViewController.swift
//  ear training app
//
//  Created by Ben Winkelman on 11/15/20.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController {
    
    var selectedInterval = "second"
    var selectedIntervalIndexNumber = 1
    
    private var audioPlayer = AVAudioPlayer()
    private var intervalNumber = 0
    private var correctAnswer = 0
    private var numberOfIntervals = 0
    private var numberOfIntervalTypes = 0
    
    @IBOutlet var firstAnswerButton: UIButton!
    @IBOutlet var secondAnswerButton: UIButton!
    @IBOutlet var thirdAnswerButton: UIButton!
    @IBOutlet var answerButtonsStackView: UIStackView!
    

    
    // odd numbered intervals are minor (or perfect for 4th and 5th), even are major (or augmented for 4th and 5th), except for 5ths (1 for dim, 2, for perfect, 3 for aug, add 3 as you go up)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedInterval
        navigationController?.navigationBar.prefersLargeTitles = true
        
        thirdAnswerButton.isHidden = true
        answerButtonsStackView.axis = .horizontal
        numberOfIntervals = 2
        numberOfIntervalTypes = 2

        switch selectedInterval {
        case "second":
            numberOfIntervals = 6
        case "fourth":
            firstAnswerButton.setTitle("perfect", for: .normal)
            secondAnswerButton.setTitle("augmented", for: .normal)
            
        case "fifth":
            firstAnswerButton.setTitle("diminished", for: .normal)
            secondAnswerButton.setTitle("perfect", for: .normal)
            thirdAnswerButton.setTitle("augmented", for: .normal)
            thirdAnswerButton.isHidden = false
            answerButtonsStackView.axis = .vertical
            numberOfIntervalTypes = 3
            numberOfIntervals = 6
            
        default:
            break
        }
    }
    
    @IBAction func playButton(_ sender: UIButton) {
        intervalNumber = Int.random(in: 1...numberOfIntervals)
        print("Interval number \(intervalNumber)")
        
        let sound = Bundle.main.path(forResource: "\(selectedInterval)\(intervalNumber)", ofType: "mp3")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        
        catch {
            print(error)
        }
        audioPlayer.play()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        if sender.tag == (intervalNumber - 1) % numberOfIntervalTypes {
            title = "Correct"
            intervalScores[selectedIntervalIndexNumber] += 1
        } else {
            title = "Wrong"
            intervalScores[selectedIntervalIndexNumber] -= 1
        }
        let ac = UIAlertController(title: title, message: "Your score for \(selectedInterval)s is \(intervalScores[selectedIntervalIndexNumber])" , preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
        present(ac, animated: true)
        
    }
}

//
//  DetailViewController.swift
//  ear training app
//
//  Created by Ben Winkelman on 11/15/20.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController {
    
    var selectedInterval : String?

    private var audioPlayer = AVAudioPlayer()
    private var intervalNumber = 0
    private var correctAnswer = 0

    @IBOutlet var firstAnswerButton: UIButton!
    @IBOutlet var secondAnswerButton: UIButton!
    
    // odd numbered intervals are minor (or perfect for 4th and 5th), even are major (or augmented for 4th and 5th) - only problem is would like to include diminshed fifth as well.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedInterval ?? "Choose an interval"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        if selectedInterval == "fourth" {
            firstAnswerButton.setTitle("perfect", for: .normal)
            secondAnswerButton.setTitle("augmented", for: .normal)
        }
    }

    @IBAction func playButton(_ sender: UIButton) {
        intervalNumber = Int.random(in: 1...2)
      
        let sound = Bundle.main.path(forResource: "\(selectedInterval ?? "second")\(intervalNumber)", ofType: "mp3")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        
        catch {
            print(error)
        }
        audioPlayer.play()
    }
    
        
//        let ac = UIAlertController(title: title, message: "Major or minor?", preferredStyle: .alert)
//        present(ac, animated: true)
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String

        if sender.tag == intervalNumber {
            title = "Correct"
        } else {
            title = "Wrong"
        }
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
        present(ac, animated: true)
    
  }
}

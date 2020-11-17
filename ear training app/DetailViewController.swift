//
//  DetailViewController.swift
//  ear training app
//
//  Created by Ben Winkelman on 11/15/20.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController {
    var audioPlayer = AVAudioPlayer()
    var selectedInterval : String?
    

    // odd numbered intervals are minor (or perfect for 4th and 5th), even are major (or augmented for 4th and 5th) - only problem is would like to include diminshed fifth as well.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedInterval ?? "Choose an interval"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    @IBAction func playButton(_ sender: UIButton) {
        let intervalNumber = Int.random(in: 1...2)
        let sound = Bundle.main.path(forResource: "\(selectedInterval ?? "second")\(intervalNumber)", ofType: "mp3")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        
        catch {
            print(error)
        }
        audioPlayer.play()
    
    }
}

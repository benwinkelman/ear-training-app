//
//  ViewController.swift
//  ear training app
//
//  Created by Ben Winkelman on 11/15/20.
//

import UIKit
import AVFoundation

class ViewController: UITableViewController {
    var intervals = [String]()
    
    var mp3 = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Interval training"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        intervals += ["second", "third", "fourth", "fifth", "sixth", "seventh"]
        
//        cellTapSound = [[AVAudioPlayer alloc] initWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"cellTapSound" withExtension:@"mp3"] error:nil];

//        [cellTapSound prepareToPlay];
    
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return intervals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "interval", for: indexPath)
        cell.textLabel?.text = intervals[indexPath.row]
        return cell
    }
            
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedInterval = intervals[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}


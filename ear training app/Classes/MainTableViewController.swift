//
//  ViewController.swift
//  ear training app
//
//  Created by Ben Winkelman on 11/15/20.
//

import UIKit
import AVFoundation

var secondScore = 0
var thirdScore = 0
var fourthScore = 0
var fifthScore = 0
var sixthScore = 0
var seventhScore = 0

var intervalScores = [secondScore, thirdScore, fourthScore, fifthScore, sixthScore, seventhScore]

class MainTableViewController: UITableViewController {
    
    private let intervals = ["second", "third", "fourth", "fifth", "sixth", "seventh"]
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Interval training"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return intervals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "interval", for: indexPath)
        cell.textLabel?.text = intervals[indexPath.row]
        cell.detailTextLabel?.text = String(intervalScores[indexPath.row])
        // Show high score for intervals[indexPath.row] saved in NSUserDefaults
        print ("Interval score " + String(intervalScores[indexPath.row]))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedInterval = intervals[indexPath.row]
            vc.selectedIntervalIndexNumber = indexPath.row
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}


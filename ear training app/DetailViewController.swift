//
//  DetailViewController.swift
//  ear training app
//
//  Created by Ben Winkelman on 11/15/20.
//

import UIKit

class DetailViewController: UIViewController {
    var selectedInterval : String?
    var selectedIntervalNumber = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Interval: ."
        navigationItem.largeTitleDisplayMode = .never

    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

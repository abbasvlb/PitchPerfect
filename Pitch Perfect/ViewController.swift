//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Abbas Aniefa on 22/12/15.
//  Copyright © 2015 Abbas Aniefa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingInProgress: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func stopRecording(sender: UIButton) {
        recordingInProgress.hidden=true
    }
    
    @IBAction func recordbutton(sender: UIButton) {
        
        recordingInProgress.hidden=false
        //TODO:record the voice
        print("record button clicked");
    }
}


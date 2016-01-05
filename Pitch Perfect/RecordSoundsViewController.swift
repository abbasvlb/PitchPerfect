//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Abbas Aniefa on 22/12/15.
//  Copyright © 2015 Abbas Aniefa. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController {

    @IBOutlet weak var recordingInProgress: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    // Create variable for audio reorder
    var audioRecorder:AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        stopButton.hidden=true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }


    @IBAction func stopRecording(sender: UIButton) {
        recordingInProgress.hidden=true;
        recordButton.enabled=true;
        stopButton.hidden=true;
        
        audioRecorder.stop()
        
        let audiosession = AVAudioSession.sharedInstance()
        try! audiosession.setActive(false)
    }
    
    @IBAction func recordbutton(sender: UIButton) {
        recordButton.enabled=false;
        stopButton.hidden=false;
        recordingInProgress.hidden=false;
        
        // get directory path to store the recorded audio
        let dirPath=NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        // create filename using date to save recorded file
        let currentDateTime=NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat="yyyyMMdd-HHmmss"
        let recordingName=formatter.stringFromDate(currentDateTime)+".wav"
        
        // create NSURL file path.
        let pathArray=[dirPath,recordingName]
        let filePath=NSURL.fileURLWithPathComponents(pathArray)
        
        print(filePath)
        
        // initilize the session to record audio
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        // create object for audiorecorder
        try! audioRecorder=AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.meteringEnabled=true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
        
        
    }
}


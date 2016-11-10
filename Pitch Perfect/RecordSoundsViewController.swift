//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Abbas Aniefa on 22/12/15.
//  Copyright © 2015 Abbas Aniefa. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController ,AVAudioRecorderDelegate{

    @IBOutlet weak var recordingInProgress: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    // Create variable for audio reorder
    var audioRecorder:AVAudioRecorder!
    
    var recordedAudio:RecordedAudio!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        stopButton.isHidden=true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }


    @IBAction func stopRecording(_ sender: UIButton) {
        recordingInProgress.isHidden=true;
        recordButton.isEnabled=true;
        stopButton.isHidden=true;
        
        audioRecorder.stop()
        
        let audiosession = AVAudioSession.sharedInstance()
        try! audiosession.setActive(false)
    }
    
    @IBAction func recordbutton(_ sender: UIButton) {
        recordButton.isEnabled=false;
        stopButton.isHidden=false;
        recordingInProgress.isHidden=false;
        
        // get directory path to store the recorded audio
        let dirPath=NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        
        // create filename using date to save recorded file
        let currentDateTime=Date()
        let formatter = DateFormatter()
        formatter.dateFormat="yyyyMMdd-HHmmss"
        let recordingName=formatter.string(from: currentDateTime)+".wav"
        
        // create NSURL file path.
        //let pathArray=[dirPath,recordingName]
        let path = dirPath + "/" + recordingName
        let filePath=URL(fileURLWithPath: path)
        
        print(filePath)
        
        // initilize the session to record audio - did some change
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        // create object for audiorecorder
        try! audioRecorder=AVAudioRecorder(url: filePath, settings: [:])
        audioRecorder.delegate=self
        audioRecorder.isMeteringEnabled=true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
        
        
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if(flag){
            recordedAudio=RecordedAudio()
            recordedAudio.filePathUrl=recorder.url
            recordedAudio.title=recorder.url.lastPathComponent
            
            self.performSegue(withIdentifier: "stopRecording", sender: recordedAudio)
        }else{
            recordButton.isEnabled=true;
            stopButton.isHidden=true;
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="stopRecording"){
            let playSoundVC:PlaySoundsViewController=segue.destination as! PlaySoundsViewController
            let data=sender as! RecordedAudio
            playSoundVC.recordedAudio=data;
        }
    }
}


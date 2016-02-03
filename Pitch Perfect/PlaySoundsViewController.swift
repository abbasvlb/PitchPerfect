//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Abbas Aniefa on 23/12/15.
//  Copyright © 2015 Abbas Aniefa. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var audioPlayer=AVAudioPlayer()
    var recordedAudio:RecordedAudio!
    
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        if var filePath = NSBundle.mainBundle().URLForResource("movie_quote", withExtension: "mp3"){
//            
//        }else{
//            print("filepath is empty")
//        }
        
        audioPlayer=try! AVAudioPlayer(contentsOfURL: recordedAudio.filePathUrl)
        audioPlayer.enableRate=true
        
        audioEngine=AVAudioEngine()
        audioFile=try! AVAudioFile(forReading: recordedAudio.filePathUrl)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playslow(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.rate=0.5
        audioPlayer.play()
        
    }

    @IBAction func stopButton(sender: AnyObject) {
        audioPlayer.stop()
    }
    @IBAction func playFast(sender: AnyObject) {
        audioPlayer.stop()
        audioPlayer.rate=1.5
        audioPlayer.play()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
        playCustomVoice(1000)
    }
    
    func playCustomVoice(pitch: Float){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        let audioNode=AVAudioPlayerNode()
        audioEngine.attachNode(audioNode)
        
        let audioPitch=AVAudioUnitTimePitch()
        audioPitch.pitch=pitch
        audioEngine.attachNode(audioPitch)
        
        audioEngine.connect(audioNode, to: audioPitch, format: nil)
        audioEngine.connect(audioPitch, to: audioEngine.outputNode, format: nil)
        
        audioNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        try! audioEngine.start()
        
        audioNode.play()
    }

    @IBAction func playDarthvander(sender: UIButton) {
        playCustomVoice(-1000)
    }
}

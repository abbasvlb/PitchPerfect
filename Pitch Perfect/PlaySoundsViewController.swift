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
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        if var filePath = NSBundle.mainBundle().URLForResource("movie_quote", withExtension: "mp3"){
//            
//        }else{
//            print("filepath is empty")
//        }
        
        audioPlayer=try! AVAudioPlayer(contentsOfURL: recordedAudio.filePathUrl)
        audioPlayer.enableRate=true
        
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
    }

}

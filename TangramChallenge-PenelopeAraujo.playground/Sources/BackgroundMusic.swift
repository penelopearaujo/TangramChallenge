import Foundation
import PlaygroundSupport
import AVFoundation
import UIKit


func setBackgroundMusic(to path: String){
    
    let backgroundAudio = AVAudioPlayer()
    
    do {
        try backgroundMusic = AVAudioPlayer(contentsOf: Bundle.main.url(forResource: path, withExtension: "mp3")!)
        backgroundAudio.numberOfLoops = -1
        backgroundMusic = backgroundAudio
        backgroundMusic.volume = 40.0
    } catch let error {
        print(error.localizedDescription)
    }
}

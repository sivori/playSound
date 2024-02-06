import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the audio player
        if let soundURL = Bundle.main.url(forResource: "sound", withExtension: "caf") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.prepareToPlay() // Preload the buffer to reduce latency when playing
            } catch {
                print("Could not load file: \(error)")
            }
        }
    }
    
    // The playSoundButtonClicked action should be outside the viewDidLoad method.
    @IBAction func playSoundButtonClicked(_ sender: Any) {
        audioPlayer?.play()
    }
}

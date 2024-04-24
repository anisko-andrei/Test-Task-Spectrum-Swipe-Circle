
import Foundation
import SwiftUI
import AVFoundation


class TapticFeedbackManager {
    @AppStorage("soundIsOn") private var soundIsOn: Bool = true
    @AppStorage("vibroIsOn") private var vibroIsOn: Bool = true
    let vibro = UIImpactFeedbackGenerator(style: .light)
    var soundURL: URL? = Bundle.main.url(forResource: "bounce", withExtension: ".mp3")
    var gameSoundURL: URL? = Bundle.main.url(forResource: "gameSound", withExtension: ".mp3")
    var audioPlayer = AVAudioPlayer()
    var gameAdioPlayer = AVAudioPlayer()
    private init() {
       
    }
    
    public static var shared = TapticFeedbackManager()
    
    func tapticEffect() {
       vibroEffect()
       soundEffect()
    }
    
    func vibroEffect() {
        if vibroIsOn {
            vibro.impactOccurred()
        }
    }
    
    func soundEffect() {
        if soundIsOn {

            guard let soundURL else {return}
            do {
               
                       audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                       audioPlayer.play()
                  } catch {
                     // couldn't load file :(
                  }
        }
    }
    
    func playGameSound() {
        if soundIsOn {

            guard let gameSoundURL else {return}
            do {
               
                gameAdioPlayer = try AVAudioPlayer(contentsOf: gameSoundURL)
                gameAdioPlayer.numberOfLoops = -1
                gameAdioPlayer.play()
                
                  } catch {
                     // couldn't load file :(
                  }
        }
    }
}

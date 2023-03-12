//
//  SoundPlayer.swift
//  MyList
//
//  Created by Adesh on 12/03/23.
//

import Foundation
import UIKit
import AVFoundation

class SoundPlayer {
    var player: AVAudioPlayer!
    
    func playFavoriteSound() {
        let url = Bundle.main.url(forResource: "Correct-ding-sound-effect", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    func playDeleteSound() {
        let url = Bundle.main.url(forResource: "Empty-trash", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

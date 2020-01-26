

import Foundation

class TimerItem : Codable{
    var duration: Double = 0.0
    var pausedTime: Double = 0.0
    var displayTime: String = "00:00:00"
    var stateImage: String? = nil
    
    func incrementDuration(_ interval:Double) {
        duration += interval
        displayTime = formatTime(Int(duration))
    }
    
    func incrementPausedTime(_ interval:Double){
        pausedTime += interval
    }
    
    func formatTime(_ timeInSeconds: Int) -> String {
        return "\(String(format: "%02d", (timeInSeconds / 3600)))" +
        ":\(String(format: "%02d", (timeInSeconds % 3600) / 60))" +
        ":\(String(format: "%02d", (timeInSeconds % 3600) % 60))"
    }
    
    func showPlayButton() {
        stateImage = "play"
    }
    
    func showPauseButton() {
        stateImage = "pause"
    }
}

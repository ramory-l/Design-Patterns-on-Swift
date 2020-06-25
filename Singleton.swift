import UIKit

/* Реализация паттерна проектирования "Singleton" */

class Settings {
    static let shared = Settings()
    
    var colorStyle = UIColor.white
    var volumeLevel: Float = 1.0
    
    private init() {}
}


print(Settings.shared.volumeLevel)

/* Протестировать можно только в Xcode Playgrounds */

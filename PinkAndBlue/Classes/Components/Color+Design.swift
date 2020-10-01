
import SwiftUI

extension Color {
    init(red: UInt, green: UInt, blue: UInt, alpha: Double = 1) {
        self.init(red: Double(red) / 255.0,
            green: Double(green) / 255.0,
            blue: Double(blue) / 255.0,
            opacity: alpha)
    }
}

extension Color {

    static let facebook = Color(red: 24, green: 119, blue: 242)
    static let twitter = Color(red: 29, green: 161, blue: 242)
}
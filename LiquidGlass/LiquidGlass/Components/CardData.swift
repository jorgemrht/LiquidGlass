import SwiftUI

struct CardData: Identifiable {

    enum Appearance: Hashable {
        case red
        case dark
    }

    let id = UUID()

    let title: String
    let ctaTitle: String
    let footerText: String
    let appearance: Appearance
    let centerSystemImage: String
    let action: () -> Void
    let accessibilityLabel: String?
}

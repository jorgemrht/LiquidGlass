import SwiftUI

struct CardMusicView: View {

    let data: CardData

    var body: some View {
        ZStack {
            background
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(color: .black.opacity(0.25), radius: 12, x: 0, y: 6)

            VStack(spacing: 0) {
                Text(data.title)
                    .font(.title.weight(.semibold))
                    .multilineTextAlignment(.center)
                    .padding()
                    .foregroundStyle(.white)

                Spacer()

                Image(systemName: data.centerSystemImage)
                    .font(.system(size: 46).bold())
                    .foregroundStyle(centerForegroundStyle)
                    .shadow(color: .black.opacity(0.35), radius: 8, y: 6)

                Spacer()

                VStack(spacing: 6) {
                    Button(action: data.action) {
                        Text(data.ctaTitle)
                            .font(.subheadline.weight(.bold))
                            .foregroundStyle(.white)
                            .padding()
                    }

                    Text(data.footerText)
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 16)
                }
            }
        }
        .frame(height: 380)
        .padding()
        .accessibilityElement(children: .combine)
        .accessibilityLabel(data.accessibilityLabel ?? data.title)
    }

    // MARK: - Partes privadas

    private var background: Color {
        switch data.appearance {
            case .red: .red
            case .dark: .black
        }
    }

    private var centerForegroundStyle: Color {
        switch data.appearance {
            case .red: .white
            case .dark: .red
        }
    }
}

#Preview {
    CardMusicView(data: CardData(
        title: "Music just for you",
        ctaTitle: "Start listening",
        footerText: "The plan will automatically renew for €10.99 per month until you cancel it",
        appearance: .red,
        centerSystemImage: "play.fill",
        action: {  },
        accessibilityLabel: "The plan will renew for $11/month until you cancel it."
    ))
}

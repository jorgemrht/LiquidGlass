import SwiftUI

extension LiquidTabbarView {
    enum TabID: Hashable { case home, radio, library, search }
    private var searchMode: Bool { isSearching || selection == .search }

    private var cards: [CardData] {
        [promo, family, promo, family]
    }
}


struct LiquidTabbarView: View {

    @Environment(\.isSearching) private var isSearching

    @State private var search = ""
    @State private var isPlaying = false
    @State private var selection: TabID = .home

    var body: some View {
        TabView(selection: $selection) {
            Tab(value: .home) {
                ScrollView() {
                    LazyVStack(spacing: 0) {
                        ForEach(cards) { model in
                            CardMusicView(data: model)
                        }
                    }
                    .toolbarBackground(
                      LinearGradient(colors: [.indigo.opacity(0.6), .blue.opacity(0.6)],
                                     startPoint: .topLeading, endPoint: .bottomTrailing),
                      for: .tabBar
                    )
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
                    .toolbarColorScheme(.dark, for: .tabBar)
                    .padding(.vertical, 24)
                }
            } label: {
                Label("Start", systemImage: "house")
            }

            Tab(value: .radio) {
                Text("Radio")
            } label: {
                Label("Radio", systemImage: "dot.radiowaves.left.and.right")
            }

            Tab(value: .library) {
                Text("Library")
            } label: {
                Label("Library", systemImage: "books.vertical")
            }

            Tab(value: .search, role: .search) {
                NavigationStack {
                    Text("Search")
                }
            }
        }
        .tint(.red)
        .searchable(text: $search, prompt: "Artists, songs, albums")
        .tabBarMinimizeBehavior(.onScrollDown)
        .tabViewBottomAccessory {
            MiniPlayerBar(isPlaying: $isPlaying)
        }
    }
}

#Preview {
    LiquidTabbarView()
}

extension LiquidTabbarView {
    private struct MiniPlayerBar: View {

        @Environment(\.tabViewBottomAccessoryPlacement) var placement
        @Binding var isPlaying: Bool

        var body: some View {
            HStack(spacing: 16) {
                if placement != .inline {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(.quaternary)
                        .frame(width: 44, height: 44)
                        .overlay(Image(systemName: "music.note").imageScale(.small))
                }

                VStack(alignment: .leading, spacing: 2) {
                    Text("Never Gonna Give You Up")
                        .font(.subheadline).bold()
                        .lineLimit(1)

                    Text("Rick Astley")
                        .font(.caption)
                        .lineLimit(1)
                }

                Spacer(minLength: placement == .inline ? 8 : 0)

                HStack(spacing: placement == .inline ? 8 : 0) {
                    if placement != .inline {
                        Button { } label: { Image(systemName: "backward.fill") }

                        Button { isPlaying.toggle() } label: {
                            Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                        }
                    }

                    Button { } label: { Image(systemName: "forward.fill") }
                }
                .buttonStyle(.glass)
                .buttonBorderShape(.circle)
                .controlSize(.regular)
                .symbolRenderingMode(.hierarchical)
            }
            .id(placement == .expanded)
            .padding()
        }
    }

    private var promo: CardData {
        CardData(
            title: "100 million songs to stream or download. No ads",
            ctaTitle: "Try now",
            footerText: "The plan will automatically renew for €10.99 per month until you cancel it",
            appearance: .red,
            centerSystemImage: "play.fill",
            action: {},
            accessibilityLabel: "Offer: 100 million songs ad-free. Try now"
        )
    }

    private var family: CardData {
        CardData(
            title: "Music for the whole family",
            ctaTitle: "Start listening",
            footerText: "The plan will renew for €16.99/month until you cancel it",
            appearance: .dark,
            centerSystemImage: "person.3.fill",
            action: {},
            accessibilityLabel: "Family Music Plan. Start listening"
        )
    }
}

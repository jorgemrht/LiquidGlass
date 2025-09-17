import SwiftUI

struct MainView: View {
    var body: some View {

        VStack(spacing: 0) {
            ZStack {
                Rectangle()
                    .fill(Color.blue.gradient)

                VStack(spacing: 24) {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .padding()
                        .glassEffect(.clear.interactive(), in: .rect)

                    HStack(spacing: 24) {
                        Image(systemName: "globe")
                            .imageScale(.large)
                            .padding()
                            .glassEffect()

                        Image(systemName: "globe")
                            .imageScale(.large)
                            .padding()
                            .glassEffect(.clear.interactive(), in: .rect)

                        Image(systemName: "globe")
                            .imageScale(.large)
                            .padding()
                            .glassEffect(.identity.interactive())
                    }
                }
            }
            .frame(maxHeight: 280)

            ZStack {
                Rectangle()
                    .fill(Color.red.gradient)

                // In liquid glass, we have three types to make with glassEffect
                VStack(spacing: 16) {
                    Text("Hello, world!")
                        .padding()
                        .glassEffect(.regular.interactive()) // default

                    HStack {
                        Text("Hello, world!")
                            .padding()
                            .glassEffect(.clear) // Remove the tint color, pick up the background color, and increase the transparency of the element

                        Text("Hello, world!")
                            .padding()
                            .glassEffect(.identity)
                    }

                    HStack(spacing: 24) {
                        // The default liquid glass buttons are capsules by default, but with the parameter en we can tell it what geometric shape you want
                        Text("Hello, world!")
                            .padding()
                            .glassEffect(.regular.tint(.blue).interactive(), in: .ellipse)

                        Text("Hello, world!")
                            .padding()
                            .glassEffect(.regular.tint(.blue).interactive())
                    }

                    Text("Hello, world!")
                        .padding()
                        .glassEffect(.regular.interactive()) // default
                }
            }


            ZStack {
                Rectangle()
                    .fill(Color.orange.gradient)

                VStack(spacing: 24) {
                    // With transparency but responds like liquid glass
                    HStack(spacing: 24) {
                        Button {  } label: {
                            Text("Press me")
                        }
                        .controlSize(.large)
                        .buttonStyle(.glass)
                        .tint(.gray)

                        Button {  } label: {
                            Text("Press me")
                        }
                        .controlSize(.large)
                        .buttonStyle(.glass)
                    }
                    // No transparency, but responds like liquid glass
                    HStack(spacing: 24) {
                        Button {  } label: {
                            Text("Press me")
                        }
                        .buttonStyle(.glassProminent)
                        .tint(.orange)

                        Button {  } label: {
                            Text("Press me")
                        }
                        .buttonStyle(.glassProminent)
                    }

                    GlassEffectContainer {
                        HStack(spacing: 24) {
                            Button("Inherit") { }
                                .buttonStyle(.glass)

                            Button("Indigo") { }
                                .buttonStyle(.glass)
                                .tint(.blue) // override
                        }
                    }
                    .tint(.white)  // by default
                }
            }
            .frame(maxHeight: 220)
        }
        .ignoresSafeArea(edges: .all)
    }
}

#Preview {
    MainView()
}


import SwiftUI

struct GameView: View {
    @Environment(\.dismiss) var dismiss
    @State private var settingOpen = false
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                BackgroundView(bgFor: .game)
                
                settingsButton
                
                
                if settingOpen {
                    
                    SettingsView(isPresented: $settingOpen, proxy: proxy) {
                        dismiss()
                    }
                        .frame(alignment: .center)
                }
            }
        }
        .statusBar(hidden: true)

    }
    var settingsButton: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation(.easeIn(duration: 0.1)) {
                        settingOpen.toggle()
                    }
                    
                }, label: {
                    Image("Pause")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                })
                
                Spacer()
            }
            .padding()
            
            Spacer()
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    GameView()
}

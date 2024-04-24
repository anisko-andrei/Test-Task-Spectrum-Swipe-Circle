
import SwiftUI

@main
struct SpectrumSwipeCircleApp: App {
    @AppStorage("soundIsOn") private var soundIsOn: Bool = true
    @State var isActive = true
    var body: some Scene {
        WindowGroup {
            ZStack {
                if isActive {
                    SplashView()
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                isActive.toggle()
                            }
                        }
                    
                } else {
                    MainMenuView()
                }
            }
            .statusBar(hidden: true)
            .onAppear(perform: {
                TapticFeedbackManager.shared.playGameSound()
            })
            .onChange(of: soundIsOn) {
                if soundIsOn {
                    TapticFeedbackManager.shared.playGameSound()
                } else {
                    TapticFeedbackManager.shared.gameAdioPlayer.stop()
                }
            }
            .onDisappear{
                TapticFeedbackManager.shared.gameAdioPlayer.stop()
            }
        }
        
    }
    
}

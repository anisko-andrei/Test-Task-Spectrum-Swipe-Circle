
import SwiftUI

@main
struct SpectrumSwipeCircleApp: App {
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
        }
        
    }
    
}

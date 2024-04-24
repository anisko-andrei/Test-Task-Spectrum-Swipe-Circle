
import SwiftUI

struct GameView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var vm = GameViewModel()
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                BackgroundView(bgFor: .game)
                
                settingsButton
                
                GameFieldView(vm: vm, proxy: proxy)
                    .frame(alignment: .center)
                
                if vm.settingOpen {
                    SettingsView(isPresented: $vm.settingOpen, proxy: proxy) {
                        dismiss()
                    }
                    .frame(alignment: .center)
                }
                
                if vm.youWin {
                    YouWinView(isPresented: $vm.youWin, currentScore: vm.currentScore, proxy: proxy, dismiss: {
                        dismiss()
                    }, startNew: {
                        vm.startNewGame()
                    })
                    .frame(alignment: .center)
                }
            }
        }
        .statusBar(hidden: true)
        .onChange(of: vm.settingOpen) {
            vm.pauseGame()
        }
    }
    
    var settingsButton: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation(.easeIn(duration: 0.1)) {
                        vm.settingOpen.toggle()
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



import SwiftUI

struct GameFieldView: View {
    @ObservedObject var vm: GameViewModel
    var proxy: GeometryProxy
    
    @State private var offset = CGSize.zero
    
    var body: some View {
        
        ZStack {
            Image(vm.field?.imgName ?? "")
                .resizable()
                .scaledToFit()
                .frame(width: proxy.size.width / 500 > 1 ? proxy.size.width/1.8 : proxy.size.width/1.1, alignment: .center)
            Image(vm.rubin?.imgName ?? "")
                .resizable()
                .scaledToFit()
                .frame(width: proxy.size.width / 500 > 1 ? proxy.size.width/6.4 : proxy.size.width/4.4, alignment: .center)
                .offset(offset)
                .gesture(
                    DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                        .onChanged({ value in
                            offset = value.translation
                            TapticFeedbackManager.shared.vibroEffect()
                            
                        })
                        .onEnded { value in
                            print(value.translation)
                            TapticFeedbackManager.shared.soundEffect()
                            DispatchQueue.main.async {
                                let viewSize = proxy.size.width / 500 > 1 ? proxy.size.width / 1.8 : proxy.size.width / 1.1
                                
                                switch(value.translation.width, value.translation.height) {
                                    case (-viewSize...0, -viewSize...0):
                                        do {
                                            print("leftUP swipe")
                                            vm.checkColors(sideColor: vm.field?.fieldColors.leftUp)
                                        }
                                    case (0...viewSize, -viewSize...0):
                                        do {
                                            print("rightUP swipe")
                                            vm.checkColors(sideColor: vm.field?.fieldColors.rigthUp)
                                        }
                                    case (0...viewSize, 0...viewSize):
                                        do {
                                            vm.checkColors(sideColor: vm.field?.fieldColors.rightDown)
                                            print("downright swipe")
                                        }
                                    case (-viewSize...0, 0...viewSize): 
                                        do {
                                            print("Leftdown swipe")
                                            vm.checkColors(sideColor: vm.field?.fieldColors.leftDown)
                                        }
                                    default:
                                        print("=(")
                                }
                            
                               
                                withAnimation {
                                    self.offset = .zero
                                }
                            }
                        }
                )
            
        }
        .onAppear{
            vm.startNewGame()
        }
    }
}

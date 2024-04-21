
import SwiftUI

struct SplashView: View {
    @State var animate = false
    
    var body: some View {
        ZStack {
            BackgroundView(bgFor: .menu)
            VStack {
                Image("loadingCircle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 132)
                    .rotationEffect(animate ? .degrees(360) : .degrees(0))
                    .offset(y: animate ? 0 : -50)
                
                    .animation(.default.repeatForever(), value: animate)
                    .onAppear {
                        DispatchQueue.main.async {
                            animate.toggle()
                        }
                    }
                
                Image("Loading")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 152)
            }
        }
    }
}


#Preview {
    SplashView()
}

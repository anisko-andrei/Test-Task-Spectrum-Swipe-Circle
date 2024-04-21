
import SwiftUI

struct BackgroundView: View {
    enum BackgroundFor {
        case menu, game
    }
    var bgFor: BackgroundFor
    
    var body: some View {
        GeometryReader { proxy in
            Image(bgFor == .menu ? "BG_1" : "BG_2")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: proxy.size.width, maxHeight: proxy.size.height)
        }
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView(bgFor: .menu)
}

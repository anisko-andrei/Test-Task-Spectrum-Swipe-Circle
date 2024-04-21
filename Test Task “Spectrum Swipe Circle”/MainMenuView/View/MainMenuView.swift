
import SwiftUI
import SafariServices

struct MainMenuView: View {
    var body: some View {
        ZStack {
            BackgroundView(bgFor: .menu)
            VStack {
                Spacer()
                Image("lionMenu")
                    .resizable()
                    .scaledToFit()
                
                playNowButton
                
                privacyButton
                
                Spacer()
            }
        }
    }
    
    var playNowButton: some View {
        Button(action: {
            
        }, label: {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 280, height: 70)
                .background(
                    LinearGradient(
                        stops: [
                            Gradient.Stop(color: Color(hex: "#7000FF"), location: 0.00),
                            Gradient.Stop(color: Color(hex: "#200048"), location: 1.00),
                        ],
                        startPoint: UnitPoint(x: 0.5, y: 0.14),
                        endPoint: UnitPoint(x: 0.5, y: 1)
                    )
                )
                .cornerRadius(80.93838)
                .overlay(
                    RoundedRectangle(cornerRadius: 80.93838)
                        .inset(by: 3)
                        .stroke(Color(hex: "#FFFFFF").opacity(0.34), lineWidth: 6)
                )
                .overlay {
                    Image("playNow")
                        .resizable()
                        .scaledToFit()
                        .padding(.vertical, 8)
                }
        })
    }
    
    var privacyButton: some View {
        Button(action:{
            DispatchQueue.main.async {
                let vc = SFSafariViewController(url: URL(string: "https://en.wikipedia.org/wiki/Privacy_policy")!)
                UIApplication.shared.firstKeyWindow?.rootViewController?.present(vc, animated: true)
            }
            
        }, label: {
            ZStack {
                Image("buttonBack")
                    .resizable()
                    .scaledToFill()
                Text("Privacy Policy")
                    .font(Font.custom("Multiround Pro", size: 16))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
            }
            .frame(width: 180, height: 40)
            
            .clipShape(RoundedRectangle(cornerRadius: 45))
            .overlay(
                RoundedRectangle(cornerRadius: 45)
                    .inset(by: 1.17)
                    .stroke(Color(hex: "#FFFFFF"), lineWidth: 2.33766)
                
            )
            .overlay(
                RoundedRectangle(cornerRadius: 45)
                    .inset(by: 4.43)
                    .stroke(Color(hex: "#000000").opacity(0.22), lineWidth: 3.85714)
                
            )
        })
    }
}

#Preview {
    MainMenuView()
}

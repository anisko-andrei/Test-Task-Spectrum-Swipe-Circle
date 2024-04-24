
import SwiftUI

struct NotificationView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            BackgroundView(bgFor: .menu)
            
            LinearGradient(colors: [Color(hex: "#000000"), Color(hex: "#000000").opacity(0)], startPoint: .bottom, endPoint: .top)
                .opacity(0.8)
                .ignoresSafeArea()
            
            Image("lionMenu")
                .resizable()
                .scaledToFit()
            
            VStack {
                Spacer()
                
                Text("Allow notifications about bonuses and promos")
                    .font(
                        Font.custom("Inter", size: 67.42955)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color(hex: "#FFFFFF"))
                    .lineLimit(2)
                    .minimumScaleFactor(0.1)
                    .padding(.horizontal)
                    .frame(height: 60)
                
                Text("Stay tuned with best offers from our casino")
                    .font(
                        Font.custom("Inter", size: 55.91379)
                            .weight(.medium)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color(hex: "#BABABA"))
                    .lineLimit(2)
                    .minimumScaleFactor(0.1)
                    .padding(.horizontal, 60)
                    .frame(height: 40)
                
                Button(action: {
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (success, error) in
                        if let error = error {
                            print("Request Authorization Failed (\(error), \(error.localizedDescription))")
                        }
                        else{
                            dismiss()
                        }
                    }
                }
                       , label: {
                    Text("Yes, I Want Bonuses!")
                        .font(
                            Font.custom("Inter", size: 46.03609)
                                .weight(.medium)
                        )
                        .frame(height: 35)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color(hex: "#000000"))
                        .lineLimit(1)
                        .minimumScaleFactor(0.1)
                        .padding(.horizontal, 60)
                })
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color(hex: "#EDD938"))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal)
                
                Button(action: {
                    dismiss()
                }
                       , label: {
                    Text("Skip")
                        .font(
                            Font.custom("Inter", size: 46.03609)
                                .weight(.medium)
                        )
                        .frame(height: 20)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color(hex: "#BABABA"))
                        .lineLimit(1)
                        .minimumScaleFactor(0.1)
                        .padding(.horizontal, 60)
                })
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .padding(.bottom)
                
            }
        }
    }
}

#Preview {
    NotificationView()
}

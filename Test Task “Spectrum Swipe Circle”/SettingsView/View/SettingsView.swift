
import SwiftUI

struct SettingsView: View {
    @Binding var isPresented: Bool
    var proxy: GeometryProxy
    var dismiss: ()->Void
    @AppStorage("soundIsOn") private var soundIsOn: Bool = true
    @AppStorage("vibroIsOn") private var vibroIsOn: Bool = true
    
    var body: some View {
        ZStack {
            EllipticalGradient(
                stops: [
                    Gradient.Stop(color: Color(hex: "#000000"), location: 0.4),
                    Gradient.Stop(color: Color(hex: "#000000").opacity(0), location: 1.00),
                ],
                center: UnitPoint(x: 0.5, y: 0.5)
            )
            .opacity(0.7)
            .ignoresSafeArea()
            .onTapGesture {
                withAnimation(.easeOut(duration: 0.1)){
                    isPresented.toggle()
                }
            }
            Image("coins")
                .resizable()
                .scaledToFit()
                .frame(width: proxy.size.width/1.5, alignment: .center)
                .offset(y: -proxy.size.width/6)
            VStack {
                ZStack {
                    Image("settingsBG")
                        .resizable()
                        .scaledToFit()
                        .frame(width: proxy.size.width/1.5)
                        .offset(y: proxy.size.width/6)
                    
                    VStack {
                        
                        Image("settingsImg")
                            .resizable()
                            .scaledToFit()
                            .frame(width: proxy.size.width/2.3)
                            .padding(.top)
                        
                        ZStack {
                            Image("settingsRow")
                                .resizable()
                                .scaledToFit()
                            HStack {
                                Text("Sound")
                                    .font(
                                        Font.custom("Muller-Medium", size: proxy.size.width / 500 > 1 ? 27 : 17)
                                    )
                                    .scaledToFit()
                                    .foregroundStyle(Color(hex:"#000000"))
                                    .minimumScaleFactor(0.5)
                                
                                    .frame(alignment: .leading)
                                Spacer()
                                
                                Toggle("", isOn: $soundIsOn)
                                    .fixedSize()
                                    .offset(x: -proxy.size.width / 40)
                                    .scaleEffect(proxy.size.width / 500 )
                            }
                            .padding(.leading)
                            .frame(width: proxy.size.width/2)
                        }
                        .frame(width: proxy.size.width/2)
                        
                        
                        
                        ZStack {
                            Image("settingsRow")
                                .resizable()
                                .scaledToFit()
                            HStack {
                                Text("Vibration")
                                    .font(
                                        Font.custom("Muller-Medium", size: proxy.size.width / 500 > 1 ? 27 : 17)
                                            .weight(.medium)
                                    )
                                    .scaledToFit()
                                    .foregroundStyle(Color(hex:"#000000"))
                                    .minimumScaleFactor(0.5)
                                    .frame(alignment: .leading)
                                Spacer()
                                
                                Toggle("", isOn: $vibroIsOn)
                                    .fixedSize()
                                    .offset(x: -proxy.size.width / 40)
                                    .scaleEffect(proxy.size.width / 500 )
                            }
                            .padding(.leading)
                            .frame(width: proxy.size.width/2)
                        }
                        .frame(width: proxy.size.width/2)
                        
                        
                    }
                    .offset(y: proxy.size.width/8)
                }
                
                Button(action: {
                    dismiss()
                }, label: {
                    ZStack {
                        Image("exitButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: proxy.size.width/2.5)
                        Text("Back to menu")
                            .font(Font.custom("Multiround Pro", size: proxy.size.width / 500 > 1 ? 27 : 14))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color(hex: "#FFFFFF"))
                    }
                })
                .offset(y: proxy.size.width/6)
            }
        }
        
    }
}


#Preview {
    GeometryReader { proxy in
        SettingsView(isPresented: .constant(true), proxy: proxy, dismiss: {})
    }
}

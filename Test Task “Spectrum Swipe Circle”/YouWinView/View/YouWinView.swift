
import SwiftUI

struct YouWinView : View {
    
    @Binding var isPresented: Bool
    var currentScore: Int
    var proxy: GeometryProxy
    var dismiss: ()->Void
    var startNew: () -> Void
    @AppStorage("bestScore") private var bestScore: Int = 0
    
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
        
            VStack {
                Image(currentScore < bestScore ? "tryNow" : "youWin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: proxy.size.width/1.5, alignment: .center)
                
                ZStack {
                    Image("buttonBack")
                        .resizable()
                        .scaledToFit()
                        .frame(width: proxy.size.width/1.5)
                    
                    
                    VStack {
                        Group {
                            Text("Score ") +
                            Text("\(currentScore)")
                                .foregroundColor(Color(hex:"#FFB800")) +
                            Text("\nBEST ") +
                            Text("\(bestScore)")
                                .foregroundColor(Color(hex:"#FFB800"))
                            
                            
                        }
                        .padding()
                        .frame(width: proxy.size.width/1.5)
                        .font(Font.custom("Multiround Pro", size: 58.81179))
                        .lineLimit(2)
                        .minimumScaleFactor(0.1)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(hex: "#FFFFFF"))
                    }
                    
                }
                HStack {
                    Button(action: {
                       startNew()
                        isPresented.toggle()
                    }, label: {
                        ZStack {
                            Image("againB")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                            Text("Start Arain")
                                .font(Font.custom("Multiround Pro", size: proxy.size.width / 500 > 1 ? 27 : 14))
                                .multilineTextAlignment(.center)
                                .foregroundStyle(Color(hex: "#FFFFFF"))
                        }
                    })
                  
                    Button(action: {
                        dismiss()
                    }, label: {
                        ZStack {
                            Image("exitButton")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                            Text("Back to menu")
                                .font(Font.custom("Multiround Pro", size: proxy.size.width / 500 > 1 ? 27 : 14))
                                .multilineTextAlignment(.center)
                                .foregroundStyle(Color(hex: "#FFFFFF"))
                        }
                    })
                }
                .padding(.top)
                .padding(.horizontal,proxy.size.width / 7)
            }
        }
    }
}


#Preview {
    GeometryReader { proxy in
        YouWinView(isPresented: .constant(true), currentScore: 0, proxy: proxy, dismiss: {
            
        }, startNew: {
            
        })
    }
}

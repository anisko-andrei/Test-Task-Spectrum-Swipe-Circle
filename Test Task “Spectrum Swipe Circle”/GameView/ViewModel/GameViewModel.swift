
import Foundation
import SwiftUI

class GameViewModel: ObservableObject {
    @AppStorage("bestScore") private var bestScore: Int = 0
    
    @Published var settingOpen = false
    @Published var youWin = false
    
    @Published var fields: [Field] = [
        Field(imgName: "01",
              fieldColors: FieldSidesColor(
                leftUp: .red,
                leftDown: .blue,
                rigthUp: .yellow,
                rightDown: .green)
             ),
        Field(imgName: "02",
              fieldColors: FieldSidesColor(
                leftUp: .blue,
                leftDown: .green,
                rigthUp: .red,
                rightDown: .yellow)
             ),
        Field(imgName: "03",
              fieldColors: FieldSidesColor(
                leftUp: .green,
                leftDown: .yellow,
                rigthUp: .blue,
                rightDown: .red)
             ),
        Field(imgName: "04",
              fieldColors: FieldSidesColor(
                leftUp: .yellow,
                leftDown: .red,
                rigthUp: .green,
                rightDown: .blue)
             )
    ]
    
    @Published var rubins: [Rubin] = [Rubin(imgName: "red",
                                            color: .red),
                                      Rubin(imgName: "yellow",
                                            color: .yellow),
                                      Rubin(imgName: "green",
                                            color: .green),
                                      Rubin(imgName: "blue",
                                            color: .blue),
    ]
    
    @Published var field: Field?
    @Published var rubin: Rubin?
    
    @Published var currentScore: Int = 0
    
    func startNewGame() {
        DispatchQueue.main.async { [weak self] in
            self?.currentScore = 0
        }
    }
    func checkColors(sideColor: FieldColors?) {
        if let rubin, rubin.color == sideColor {
            print("OK")
            currentScore += 1
        }
        else {
            DispatchQueue.main.async { [weak self] in
                self?.youWin.toggle()
                if self?.bestScore ?? 0 < self?.currentScore ?? 0 {
                    self?.bestScore = self?.currentScore ?? 0
                }
            }
        }
    }
    
}


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
    
    var timer: Timer?
    var time = 2.0
    
    func startNewGame() {
        DispatchQueue.main.async { [weak self] in
            guard let self else {return}
            self.time = 2
            self.startTimer()
            self.currentScore = 0
            self.field = self.fields.randomElement()
            self.rubin = self.rubins.randomElement()
            
        }
    }
    
    func startTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.time -= 0.1
            print(self.time)
            if self.time <= 0.0 {
                self.stopGame()
            }
        }
    }
    
    func checkColors(sideColor: FieldColors?) {
        if let rubin, rubin.color == sideColor {
            time = 2
            print("OK")
            currentScore += 1
            field = fields.randomElement()
            self.rubin = rubins.randomElement()
        }
        else {
           stopGame()
        }
    }
    
    func stopGame() {
        DispatchQueue.main.async { [weak self] in
            self?.timer?.invalidate()
            self?.timer = nil
            
            self?.youWin.toggle()
            if self?.bestScore ?? 0 < self?.currentScore ?? 0 {
                self?.bestScore = self?.currentScore ?? 0
            }
        }
    }
    
    func pauseGame() {
        if let timer  {
            timer.invalidate()
            self.timer = nil
        } else {
            startTimer()
        }
        
    }
}

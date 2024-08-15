//
//  Timer.swift
//  SwiftySudoku
//
//  Created by Alice Wheeler on 2024-08-15.
//

import Foundation
import Combine

class TimerModel: ObservableObject {
    @Published var elapsedTime: Int = 0
    private var timer: Timer?

    func startTimer() {
        stopTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.elapsedTime += 1
        }
    }


    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    func resetTimer() {
        elapsedTime = 0
        startTimer() 
    }
}

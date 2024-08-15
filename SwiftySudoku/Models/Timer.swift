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
    private var cancellable: AnyCancellable?

    var formattedTime: String {
        let minutes = elapsedTime / 60
        let seconds = elapsedTime % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    func startTimer() {
            cancellable = Timer.publish(every: 1.0, on: .main, in: .common)
                .autoconnect()
                .sink { [weak self] _ in
                    DispatchQueue.main.async {
                        self?.elapsedTime += 1
                    }
                }
        }

    func stopTimer() {
        cancellable?.cancel()
        cancellable = nil
    }

    func resetTimer() {
        elapsedTime = 0
        startTimer()
    }
}

//
//  PuzzleViewModel.swift
//  SwiftySudoku
//
//  Created by Alice Wheeler on 2024-08-15.
//

import Combine
import SwiftUI

class PuzzleViewModel: ObservableObject {
    @Published var puzzle: [[Int]] = Array(repeating: Array(repeating: 0, count: 9), count: 9)
    @Published var isLoading: Bool = false
    @Published var selectedCell: (row: Int, col: Int)?
    @Published var mistakesCount: Int = 0
    @Published var isGameOver: Bool = false
    @Published var isPuzzleCompleted: Bool = false
    @Published var formattedTime: String = "00:00"

    
    private var puzzleModel = Puzzle()
    private var currentDifficulty: Difficulty?
    private var timerModel = TimerModel()
    
    func startGame(difficulty: Difficulty) {
        isLoading = true 
        currentDifficulty = difficulty
        mistakesCount = 0
        isGameOver = false
        isPuzzleCompleted = false
        selectedCell = nil
        formattedTime = "00:00"
        
        DispatchQueue.global(qos: .userInitiated).async {
            let generatedPuzzle = self.puzzleModel.generateSudokuPuzzle(difficulty: difficulty)
            
            DispatchQueue.main.async {
                self.puzzle = generatedPuzzle
                self.isLoading = false
                self.timerModel.startTimer()
                
                self.timerModel.$elapsedTime
                    .map { String(format: "%02d:%02d", $0 / 60, $0 % 60) }
                    .assign(to: &self.$formattedTime)
            }
        }
    }
    
    func selectCell(row: Int, col: Int) {
        if puzzle[row][col] == 0 {
            selectedCell = (row, col)
        }
    }
    
    func enterNumber(_ number: Int) {
        guard let selected = selectedCell else { return }
        
        if puzzleModel.isNumberValid(row: selected.row, col: selected.col, number: number) {
            puzzle[selected.row][selected.col] = number
            selectedCell = nil
            checkForCompletion()
        } else {
            mistakesCount += 1
            
            if mistakesCount >= 3 {
                isGameOver = true
                timerModel.stopTimer() 
            }
        }
    }
    
    private func checkForCompletion() {
        for row in puzzle {
            if row.contains(0) {
                return
            }
        }
        
        isPuzzleCompleted = true
        isGameOver = true
        timerModel.stopTimer()
    }
    
    func resetGame() {
        guard let difficulty = currentDifficulty else { return }
        puzzle = puzzleModel.generateSudokuPuzzle(difficulty: difficulty)
        mistakesCount = 0
        isGameOver = false
        isPuzzleCompleted = false
        selectedCell = nil
        timerModel.resetTimer()
        formattedTime = "00:00"
    }
    
    func getElapsedTime() -> Int {
            return timerModel.elapsedTime
        }
        
        func stopTimer() {
            timerModel.stopTimer()
        }
        
        func resetTimer() {
            timerModel.resetTimer()
        }
}

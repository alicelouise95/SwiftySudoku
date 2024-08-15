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
    @Published var selectedCell: (row: Int, col: Int)?
    @Published var mistakesCount: Int = 0
    @Published var isGameOver: Bool = false
    @Published var isPuzzleCompleted: Bool = false
    
    private var puzzleModel = Puzzle()
    private var currentDifficulty: Difficulty?
    
    func startGame(difficulty: Difficulty) {
        puzzle = puzzleModel.generateSudokuPuzzle(difficulty: difficulty)
        
        mistakesCount = 0
        isGameOver = false
        isPuzzleCompleted = false
        selectedCell = nil
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
    }
    
    func resetGame() {
        guard let difficulty = currentDifficulty else { return }
        startGame(difficulty: difficulty)
    }
}


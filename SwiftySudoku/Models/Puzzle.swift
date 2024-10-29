import Foundation

class Puzzle {
    var puzzle: [[Int]] = []
    
    func generateSudokuPuzzle(difficulty: Difficulty) -> [[Int]] {
        puzzle = Array(repeating: Array(repeating: 0, count: 9), count: 9)
        fillSudoku()  
        removeNumbersToCreatePuzzle(cellsToRemove: difficulty.cellsToRemove)
        return puzzle
    }
    
    private func fillSudoku() {
        _ = solveSudoku()
    }
    
    private func solveSudoku() -> Bool {
        guard let emptyCell = findEmptyCell() else { return true }
        let (row, col) = emptyCell
        let numbers = (1...9).shuffled()
        
        for number in numbers {
            if isNumberValid(row: row, col: col, number: number) {
                puzzle[row][col] = number
                if solveSudoku() {
                    return true
                }
                puzzle[row][col] = 0
            }
        }
        return false
    }
    
    func isNumberValid(row: Int, col: Int, number: Int) -> Bool {
        for j in 0..<9 {
            if puzzle[row][j] == number { return false }
        }
        for i in 0..<9 {
            if puzzle[i][col] == number { return false }
        }
        let startRow = (row / 3) * 3
        let startCol = (col / 3) * 3
        for i in startRow..<startRow + 3 {
            for j in startCol..<startCol + 3 {
                if puzzle[i][j] == number { return false }
            }
        }
        
        let originalValue = puzzle[row][col]
        puzzle[row][col] = number
        let solvable = isPuzzleSolvable()
        puzzle[row][col] = originalValue
        
        return solvable
    }
    
    private func isPuzzleSolvable() -> Bool {
        var tempPuzzle = puzzle
        return solveSudokuOnBoard(&tempPuzzle)
    }
    
    private func solveSudokuOnBoard(_ board: inout [[Int]]) -> Bool {
        guard let emptyCell = findEmptyCellInBoard(board) else { return true }
        let (row, col) = emptyCell
        
        for number in 1...9 {
            if isValidInBoard(board, row: row, col: col, number: number) {
                board[row][col] = number
                if solveSudokuOnBoard(&board) {
                    return true
                }
                board[row][col] = 0
            }
        }
        return false
    }
    
    private func isValidInBoard(_ board: [[Int]], row: Int, col: Int, number: Int) -> Bool {
        for j in 0..<9 {
            if board[row][j] == number { return false }
        }
        for i in 0..<9 {
            if board[i][col] == number { return false }
        }
        let startRow = (row / 3) * 3
        let startCol = (col / 3) * 3
        for i in startRow..<startRow + 3 {
            for j in startCol..<startCol + 3 {
                if board[i][j] == number { return false }
            }
        }
        return true
    }
    
    private func removeNumbersToCreatePuzzle(cellsToRemove: Int) {
        var count = 0
        while count < cellsToRemove {
            let row = Int.random(in: 0..<9)
            let col = Int.random(in: 0..<9)
            if puzzle[row][col] != 0 {
                let removedNumber = puzzle[row][col]
                puzzle[row][col] = 0
    
                if !hasUniqueSolution() {
                    puzzle[row][col] = removedNumber
                } else {
                    count += 1
                }
            }
        }
    }
    
    private func hasUniqueSolution() -> Bool {
        var solutionCount = 0
        var tempPuzzle = puzzle
        
        func countSolutions(_ board: inout [[Int]]) -> Bool {
            guard let emptyCell = findEmptyCellInBoard(board) else {
                solutionCount += 1
                return solutionCount <= 1
            }
            
            let (row, col) = emptyCell
            for number in 1...9 {
                if isValidInBoard(board, row: row, col: col, number: number) {
                    board[row][col] = number
                    if !countSolutions(&board) {
                        return false
                    }
                    board[row][col] = 0
                }
            }
            return solutionCount <= 1
        }
        
        return countSolutions(&tempPuzzle)
    }
    
    private func findEmptyCell() -> (row: Int, col: Int)? {
        for i in 0..<9 {
            for j in 0..<9 {
                if puzzle[i][j] == 0 {
                    return (i, j)
                }
            }
        }
        return nil
    }
    
    private func findEmptyCellInBoard(_ board: [[Int]]) -> (row: Int, col: Int)? {
        for i in 0..<9 {
            for j in 0..<9 {
                if board[i][j] == 0 {
                    return (i, j)
                }
            }
        }
        return nil
    }
}

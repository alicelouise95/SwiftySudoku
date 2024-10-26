class Puzzle {
    var puzzle: [[Int]] = []
    
    func generateSudokuPuzzle(difficulty: Difficulty) -> [[Int]] {
        puzzle = Array(repeating: Array(repeating: 0, count: 9), count: 9)
        fillSudoku()
        removeNumbersFromSudoku(cellsToRemove: difficulty.cellsToRemove)
        return puzzle
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
        
        puzzle[row][col] = number
        let isSolvable = isPuzzleSolvable()
        puzzle[row][col] = 0
        return isSolvable
    }

    
    func isPuzzleSolvable() -> Bool {
        return solveSudoku()
    }
    
    func fillSudoku() {
        _ = solveSudoku()
    }
    
    func solveSudoku() -> Bool {
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
    
    func findEmptyCell() -> (row: Int, col: Int)? {
        for i in 0..<9 {
            for j in 0..<9 {
                if puzzle[i][j] == 0 {
                    return (i, j)
                }
            }
        }
        return nil
    }
    
    private func removeNumbersFromSudoku(cellsToRemove: Int) {
        var count = 0
        while count < cellsToRemove {
            let row = Int.random(in: 0..<9)
            let col = Int.random(in: 0..<9)
            if puzzle[row][col] != 0 {
                puzzle[row][col] = 0
                count += 1
            }
        }
    }
}

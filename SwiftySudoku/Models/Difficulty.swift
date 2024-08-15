//
//  Difficulty.swift
//  SwiftySudoku
//
//  Created by Alice Wheeler on 2024-08-14.
//

import Foundation

enum Difficulty {
    case easy
    case medium
    case hard
    
    
    var cellsToRemove: Int {
        switch self {
        case .easy:
            return 20
        case .medium:
            return 40
        case .hard:
            return 55
        }
    }
}

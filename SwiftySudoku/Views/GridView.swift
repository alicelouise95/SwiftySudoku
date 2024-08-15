//
//  GridView.swift
//  SwiftySudoku
//
//  Created by Alice Wheeler on 2024-08-14.
//

import SwiftUI

struct GridView: View {
    let gridSize: Int = 9
    let cellSize: CGFloat = 40
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<gridSize, id: \.self) { row in
                HStack(spacing: 0) {
                    ForEach(0..<gridSize, id: \.self) { col in
                        CellView()
                            .frame(width: cellSize, height: cellSize)
                            .border(Color.black, width: 1)
                            .overlay(
                                BorderOverlay(row: row, col: col)
                            )
                    }
                }
            }
        }
        .border(Color.black, width: 1)
    }
}

struct CellView: View {
    var body: some View {
        Text("")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
    }
}

struct BorderOverlay: View {
    let row: Int
    let col: Int
    let thickness: CGFloat = 2.5
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                
                // Top border
                if row % 3 == 0 {
                    path.move(to: CGPoint(x: 0, y: 0))
                    path.addLine(to: CGPoint(x: geometry.size.width, y: 0))
                }
                
                // Left border
                if col % 3 == 0 {
                    path.move(to: CGPoint(x: 0, y: 0))
                    path.addLine(to: CGPoint(x: 0, y: geometry.size.height))
                }
                
                // Bottom border
                if row == 8 {
                    path.move(to: CGPoint(x: 0, y: geometry.size.height))
                    path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height))
                }
                
                // Right border
                if col == 8 {
                    path.move(to: CGPoint(x: geometry.size.width, y: 0))
                    path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height))
                }
            }
            .stroke(Color.black, lineWidth: thickness)
        }
    }
}



struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}

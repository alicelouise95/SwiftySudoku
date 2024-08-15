//
//  NumberButton.swift
//  SwiftySudoku
//
//  Created by Alice Wheeler on 2024-08-14.
//

import SwiftUI

struct NumberButton: View {
    let number: Int
    let action: (Int) -> Void
    
    init(
        number: Int,
        action: @escaping (Int) -> Void
    ) {
        self.number = number
        self.action = action
    }
    
    var body: some View {
        HStack(spacing: 3) {
            Text("\(number)")
        }
        .font(Font.custom("Nunito-Regular", size: 25))
        .foregroundColor(.black)
        .frame(maxWidth: 40, maxHeight: 60)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.black, lineWidth: 2.0)
                .fill(Color.white.opacity(0.2))
        }
    }
}

struct NumberButton_Previews: PreviewProvider {
    static var previews: some View {
        NumberButton(number: 1, action: { _ in })
    }
}


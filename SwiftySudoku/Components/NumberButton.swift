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
    
    var body: some View {
        Button(action: {
            action(number)
        }) {
            Text("\(number)")
                .font(Font.custom("Nunito-Regular", size: 25))
                .foregroundColor(.black)
                .frame(width: 40, height: 60)
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.black, lineWidth: 2.0)
                        .fill(Color.white.opacity(0.2))
                }
        }
    }
}

struct NumberButton_Previews: PreviewProvider {
    static var previews: some View {
        NumberButton(number: 1, action: { _ in
            print("Button tapped!")
        })
    }
}

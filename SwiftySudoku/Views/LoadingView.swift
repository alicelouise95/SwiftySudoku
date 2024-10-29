//
//  LoadingView.swift
//  SwiftySudoku
//
//  Created by Alice Wheeler on 2024-10-27.
//

import SwiftUI

struct LoadingView: View {
    @State private var currentTheme: Theme = Theme.current
    
    var body: some View {
        VStack{
            currentTheme.gradient
                .edgesIgnoringSafeArea(.all)
                .overlay {
                    VStack(spacing: 40){
                        Text("Generating your puzzle...")
                            .font(Font.custom("NunitoItalic-Regular", size: 20))
                        
                        ProgressView()
                            .scaleEffect(2)
                            .tint(Color("FontColor"))
                    }
                }

        }
    }
}

#Preview {
    LoadingView()
}

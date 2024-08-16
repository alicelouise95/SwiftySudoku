//
//  SettingsView.swift
//  SwiftySudoku
//
//  Created by Alice Wheeler on 2024-08-14.
//

import SwiftUI

struct SettingsView: View {
    @State private var currentTheme: Theme = .SkyFrost
    
    var body: some View {
        NavigationStack {
            VStack {
                currentTheme.gradient
                    .edgesIgnoringSafeArea(.all)
                    .overlay {
                        VStack {
                            Spacer()
                            
                            Text("Settings")
                                .font(Font.custom("Nunito-Regular", size: 20))
                            
                            
                            
                            Spacer()
                            
                            HStack(spacing: 20) {
                                NavigationLink(destination: MainView()) {
                                    Image(systemName: "house")
                                        .resizable()
                                        .frame(width: 35, height: 30)
                                        .foregroundColor(.black)
                                        .padding()
                                }
                                
                                
                                
                            }
                            .padding()
                            
                        }
                        .navigationBarBackButtonHidden(true)
                    }
            }
        }
    }
}

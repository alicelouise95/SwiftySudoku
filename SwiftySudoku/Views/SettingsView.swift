//
//  SettingsView.swift
//  SwiftySudoku
//
//  Created by Alice Wheeler on 2024-08-14.
//

import SwiftUI

struct SettingsView: View {
    @State private var currentTheme: Theme = Theme.current

    var body: some View {
        NavigationStack {
            currentTheme.gradient
                .edgesIgnoringSafeArea(.all)
                .overlay {
                    VStack {
                        Spacer()
                        
                        Text("Settings")
                            .font(Font.custom("Nunito-Regular", size: 24))
                        
                        Spacer()
                        
                        VStack(spacing: 20) {
                            ButtonView(label: "Sky Frost", isSelected: currentTheme == .SkyFrost)
                                .onTapGesture {
                                    updateTheme(.SkyFrost)
                                }

                            ButtonView(label: "Emerald Oasis", isSelected: currentTheme == .EmeraldOasis)
                                .onTapGesture {
                                    updateTheme(.EmeraldOasis)
                                }

                            ButtonView(label: "Sunset Glow", isSelected: currentTheme == .SunsetGlow)
                                .onTapGesture {
                                    updateTheme(.SunsetGlow)
                                }

                            ButtonView(label: "Ocean Breeze", isSelected: currentTheme == .OceanBreeze)
                                .onTapGesture {
                                    updateTheme(.OceanBreeze)
                                }
                        }
                        .padding(.horizontal, 40) // Ensure buttons don't extend to edges

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
        .onAppear {
            currentTheme = Theme.current
        }
    }
    
    private func updateTheme(_ theme: Theme) {
        currentTheme = theme
        Theme.current = theme
    }
}

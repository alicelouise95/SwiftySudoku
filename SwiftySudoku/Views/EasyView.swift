//
//  EasyView.swift
//  SwiftySudoku
//
//  Created by Alice Wheeler on 2024-08-14.
//

import SwiftUI

struct EasyView: View {
    @State private var currentTheme: Theme = .SkyFrost
    @StateObject private var viewModel = PuzzleViewModel()
    
    var body: some View {
        NavigationStack {
            currentTheme.gradient
                .edgesIgnoringSafeArea(.all)
                .overlay {
                    VStack {
                        Spacer()
                        
                        VStack(spacing: 20) {
                            Text("Easy")
                                .font(Font.custom("Nunito-Regular", size: 20))
                            
                            // Start the game with easy difficulty
                            GridView(viewModel: viewModel)
                                .onAppear {
                                    viewModel.startGame(difficulty: .easy)
                                }
                            
                            HStack(spacing: 3) {
                                ForEach(1..<10) { number in
                                    NumberButton(number: number) {
                                        viewModel.enterNumber($0)
                                    }
                                }
                            }
                        }
                        
                        Spacer()
                        
                        HStack(spacing: 20) {
                            NavigationLink(destination: MainView()) {
                                Image(systemName: "house")
                                    .resizable()
                                    .frame(width: 35, height: 30)
                                    .foregroundColor(.black)
                                    .padding()
                            }
                                                        
                            NavigationLink(destination: SettingsView()) {
                                Image(systemName: "gearshape")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.black)
                                    .padding()
                            }
                        }
                        .padding()
                    }
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

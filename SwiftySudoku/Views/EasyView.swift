//
//  EasyView.swift
//  SwiftySudoku
//
//  Created by Alice Wheeler on 2024-08-14.
//

import SwiftUI

struct EasyView: View {
    
    @State private var currentTheme: Theme = .SkyFrost
    @StateObject var viewModel = PuzzleViewModel()
    @State private var showAlert = false
    @State private var navigateToMainView = false
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(
                    destination: MainView(),
                    isActive: $navigateToMainView
                ) {
                    EmptyView()
                }
                
                currentTheme.gradient
                    .edgesIgnoringSafeArea(.all)
                    .overlay {
                        VStack {
                            Spacer()
                            
                            VStack(spacing: 20) {
                                HStack(spacing: 70) {
                                    Text("Time: \(viewModel.formattedTime)")                                          .font(Font.custom("Nunito-Regular", size: 20))
                                    
                                    Text("Easy")
                                        .font(Font.custom("NunitoItalic-Regular", size: 20))
                                    
                                    
                                    Text("Mistakes: \(viewModel.mistakesCount)/3")
                                        .font(Font.custom("Nunito-Regular", size: 20))
                                }
                                
                                
                                GridView(viewModel: viewModel)
                                    .onAppear {
                                        viewModel.startGame(difficulty: .easy)
                                    }
                                
                                HStack(spacing: 3) {
                                    ForEach(1..<10) { number in
                                        NumberButton(number: number) {
                                            viewModel.enterNumber($0)
                                            if viewModel.mistakesCount >= 3 {
                                                showAlert = true
                                            }
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
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Game Over"),
                            message: Text("You made 3 mistakes. Try again?"),
                            primaryButton: .default(Text("OK")) {
                                viewModel.resetGame()
                            },
                            secondaryButton: .cancel(Text("Home")) {
                                navigateToMainView = true
                            }
                        )
                    }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

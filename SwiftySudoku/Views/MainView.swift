//
//  MainView.swift
//  SwiftySudoku
//
//  Created by Alice Wheeler on 2024-08-13.
//

import SwiftUI

struct MainView: View {
    @State private var currentTheme: Theme = Theme.current

    var body: some View {
        NavigationStack {
            currentTheme.gradient
                .edgesIgnoringSafeArea(.all)
                .overlay {
                    VStack {
                        VStack(spacing: 10) {
                            Image("SwiftLogo")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .offset(x: -140)
                            
                            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                                Text("swifty")
                                    .font(Font.custom("NunitoItalic-Regular", size: 40))
                                Text("sudoku")
                                    .font(Font.custom("Nunito-Regular", size: 40))
                            }
                            
                            Image("SwiftySudokuLogo")
                                .resizable()
                                .frame(width: 230, height: 230)
                        }
                        .padding(.vertical, 20)
                        
                        VStack(spacing: 20) {
                            NavigationLink(destination: EasyView()) {
                                ButtonView(label: "Easy", isSelected: false)
                            }
                            
                            NavigationLink(destination: MediumView()) {
                                ButtonView(label: "Medium", isSelected: false)
                            }
                            
                            NavigationLink(destination: HardView()) {
                                ButtonView(label: "Hard", isSelected: false)
                            }
                            
                            NavigationLink(destination: SettingsView()) {
                                ButtonView(label: "Settings", isSelected: false)
                            }
                            
                        }
                        
                    }
                    .padding(.horizontal, 40)
                }
        }
        .navigationBarBackButtonHidden(true)
    }


        }
        

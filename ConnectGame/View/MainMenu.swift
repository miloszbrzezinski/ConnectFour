//
//  ContentView.swift
//  Connect4
//
//  Created by Milosz Brzezinski on 27/10/2022.
//

import SwiftUI

struct MainMenu: View {
    let background = LinearGradient(colors: [.cyan,.blue],
                                  startPoint: .top,
                                  endPoint: .bottom)
    
    let textColor = LinearGradient(colors: [.indigo,.blue],
                                  startPoint: .top,
                                  endPoint: .bottom)
    
    @State var isPresenting: Bool = false
    var body: some View {
        NavigationView{
            ZStack{
                Color.white
                    .ignoresSafeArea()
                background
                    .ignoresSafeArea()
                    .opacity(0.6)
                    if (isPresenting){
                        ContentView(mainMenu: $isPresenting)
                    }else{
                        VStack {
                            Text("ConnectGame").foregroundStyle(textColor)
                                .font(.system(size: 50, weight: .bold))
                            
                            Spacer()
//                            NavigationLink(destination: {}, label: {MenuButton(text: "Player vs Player")})
                            Button(action: {
                                print("2 Players")
                                isPresenting = true
                            }, label: {
                                MenuButton(text: "Player vs Player")
                            })
                            Button(action: {
                                print("vs AI")
                                isPresenting = true
                            }, label: {
                                MenuButton(text: "Player vs AI")
                            })
                            Spacer()
                        }
                    }
                    
                }
            }
        }
        
    }


struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}

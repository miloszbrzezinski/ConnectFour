//
//  MenuButton.swift
//  Connect4
//
//  Created by Milosz Brzezinski on 27/10/2022.
//

import SwiftUI

struct MenuButton: View {
    let background = LinearGradient(colors: [.white,.white],
                                  startPoint: .top,
                                  endPoint: .bottom)
    
    let textColor = LinearGradient(colors: [.cyan,.blue],
                                  startPoint: .top,
                                  endPoint: .bottom)
    
    var text: String
    
    var body: some View {
        ZStack{
            background
                .opacity(0.6)
                .ignoresSafeArea()
            Text(text)
                .bold()
                .foregroundStyle(textColor)
                .padding()
                .font(.largeTitle)
        }
        .frame(height: 90)
        .cornerRadius(15)
        .padding([.trailing,.leading], 20)
       
        
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton(text: "Button")
    }
}

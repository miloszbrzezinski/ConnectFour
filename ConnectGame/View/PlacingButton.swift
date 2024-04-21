//
//  CellView.swift
//  ConnectGame
//
//  Created by Milosz Brzezinski on 30/10/2022.
//

import SwiftUI

struct PlacingButton: View {
    let emptyCellColor = LinearGradient(colors: [.black,.gray],
                                        startPoint: .top,
                                        endPoint: .bottom)
    
    let playerOneCellColor = LinearGradient(colors: [.yellow,.orange],
                                            startPoint: .top,
                                            endPoint: .bottom)
    
    let playerTwoCellColor = LinearGradient(colors: [.red,.pink],
                                            startPoint: .top,
                                            endPoint: .bottom)
    
    @Binding var colorID: Int
    @Binding var placesLeft: Int
//    var colorID: Int
    
    
    var body: some View {
        ZStack{
            if placesLeft > 0{
                if colorID == 1{
                    playerOneCellColor
                }else if colorID == 2{
                    playerTwoCellColor
                }else{
                    emptyCellColor
                }
            }else{
                emptyCellColor
            }
            
            Text("\(placesLeft)")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
        }
        .frame(width: 45, height: 45)
        .cornerRadius(25)
        .padding([.all], 1)
    }
}

struct PlacingButton_Previews: PreviewProvider {
    static var previews: some View {
        PlacingButton(colorID: .constant(0), placesLeft: .constant(0))
//        CellView(colorID: 1)
    }
}

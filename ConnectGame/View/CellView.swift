//
//  CellView.swift
//  ConnectGame
//
//  Created by Milosz Brzezinski on 30/10/2022.
//

import SwiftUI

struct CellView: View {
    let emptyCellColor = LinearGradient(colors: [.cyan,.mint],
                                        startPoint: .top,
                                        endPoint: .bottom)
    
    let playerOneCellColor = LinearGradient(colors: [.yellow,.orange],
                                            startPoint: .top,
                                            endPoint: .bottom)
    
    let playerTwoCellColor = LinearGradient(colors: [.red,.pink],
                                            startPoint: .top,
                                            endPoint: .bottom)
  
    @ObservedObject var cell: Cell
    
    
    var body: some View {
        ZStack{
            if cell.playerID == 1{
                playerOneCellColor
            }else if cell.playerID == 2{
                playerTwoCellColor
            }else{
                emptyCellColor
                    .opacity(0.5)
            }
        }
        .frame(width: 45, height: 45)
        .cornerRadius(25)
        .padding([.all], 1)
        .onTapGesture {
            print(cell.playerID)
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(cell: Cell(col: 0, row: 0))
    }
}

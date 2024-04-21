//
//  Board.swift
//  Connect4
//
//  Created by Milosz Brzezinski on 27/10/2022.
//

import Foundation

class Board: ObservableObject{
    var board = [Cell]()
    
    init() {
        createBoard()
    }
    
    func createBoard(){
        var newCell = Cell();
        var r = 0;
        repeat{
            board.append(newCell)
            newCell = newCell.createNextCell()
            r+=1;
        }while(r<42)
    }
    
    func placeCounter(position: Int, player: Player){
        board[2].player = player
        print(board[2].player?.id)
        
    }
    
}

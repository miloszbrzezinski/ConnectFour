//
//  Cell.swift
//  Connect4
//
//  Created by Milosz Brzezinski on 27/10/2022.
//

import Foundation

class Cell: Identifiable, ObservableObject{
    let id = UUID()
    var player: Player?
    
    var upCell: Cell?
    var upRightCell: Cell?
    var rightCell: Cell?
    var downRightCell: Cell?
    var downCell: Cell?
    var downLeftCell: Cell?
    var leftCell: Cell?
    var upLeftCell: Cell?
    
    func createNextCell() -> Cell{
        self.rightCell = Cell();
        self.rightCell?.leftCell = self;
        return rightCell!;
    }
    
}

//
//  Cell.swift
//  ConnectGame
//
//  Created by Milosz Brzezinski on 30/10/2022.
//

import Foundation

class Cell: ObservableObject, Identifiable{
    
    let id = UUID()
    @Published var player: Player?
    @Published var playerID: Int = 0
    var nextCell: Cell?
    var previousCell: Cell?
    
    var col: Int
    var row: Int
    
    init(col: Int, row: Int) {
        self.col = col
        self.row = row
        //print("[",col,",",row,"]")
    }
    
    func createNextCell(col: Int, row: Int) -> Cell{
        self.nextCell = Cell(col: col, row: row);
        self.nextCell?.previousCell = self;
        return nextCell!;
    }
    
    
}

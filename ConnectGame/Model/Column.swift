//
//  Column.swift
//  ConnectGame
//
//  Created by Milosz Brzezinski on 30/10/2022.
//

import Foundation

class Column{
    
    var column = [Cell]()
    
    
    func getEmptyCells() -> Int {
        var emptyCells = 0
        for c in column {
            if c.playerID == 0 {
                emptyCells += 1
            }
        }
        
        return emptyCells
    }
    
}

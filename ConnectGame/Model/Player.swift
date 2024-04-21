//
//  Player.swift
//  Connect4
//
//  Created by Milosz Brzezinski on 27/10/2022.
//

import Foundation

class Player: ObservableObject{
    let name: String
    var playerID: Int = 1
    
    init(name: String, id: Int) {
        self.name = name
        self.playerID = id
    }
}

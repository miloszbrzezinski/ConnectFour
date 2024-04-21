//
//  Board.swift
//  ConnectGame
//
//  Created by Milosz Brzezinski on 30/10/2022.
//

import Foundation

class Board: ObservableObject{
    
    @Published var board = [Cell]()
    @Published var endGame: Bool = false
    @Published var draw: Bool = false
    
    
    var columns = [Column]()
    var rows = [Row]()
    
    init() {
        createBoard()
    }
    
    func createBoard(){
        var col = 1;
        var row = 1;
        var newCell = Cell(col: col, row: row);
        board.append(newCell)
        
        var column = Column()
        var rowArray  = Row()
        
        columns.append(column)
        rows.append(rowArray)

        repeat{
            if col < 7 {
                col += 1
                column = Column()
                columns.append(column)
            }else{
                col = 1
                if row < 7 {
                    rowArray = Row()
                    rows.append(rowArray)
                    row += 1
                }
            }
            newCell = newCell.createNextCell(col: col, row: row)
            board.append(newCell)

        }while(!(col == 7 && row == 6))
        createColumns()
        createRows()
    }
    
    func createColumns(){
        for c in board {
            columns[c.col-1].column.append(c)
        }
    }
    
    func createRows(){
        for c in board {
            rows[c.row-1].row.append(c)
        }
    }
    
    func placeCounter(position: Int, player: Player){
        let reversed = columns[position-1].column.reversed()
        for c in reversed{
            if c.playerID == 0{
                c.player = player
                c.playerID = player.playerID
                break
            }
        }
        
        endGame = hasWon()
        if isDraw() {
            draw = isDraw()
            endGame = true
        }
    }
    
    func restartGame(){
        board = [Cell]()
        columns = [Column]()
        rows = [Row]()
        createBoard()
        endGame = false
        draw = false
    }
    
    func hasHorizontal() -> Bool{
        var player: Player?
        var counter: Int = 0
        var cell: Cell = board[0]
        var finished = false
        var actRow = 1
        repeat{
            if cell.player != nil && player == nil {
                player = cell.player
                counter = 0
            }
            if cell.player?.playerID == player?.playerID && player != nil{
                counter += 1
            }else{
                counter = 0
                player = cell.player
            }
            if counter == 4 {
                return true
            }
            if let next = cell.nextCell{
                cell = next
                if actRow != next.row{
                    actRow = next.row
                    counter = 0
                    player = nil
                }
            }else{
                finished = true
            }
        }while(!finished)
        
        return false
    }
    
    func hasVertical() -> Bool{
        var player: Player?
        var counter: Int = 0
        for column in columns {
            for cell in column.column{
                if cell.player != nil && player == nil {
                    player = cell.player
                    counter = 0
                }
                if cell.player?.playerID == player?.playerID && player != nil{
                    counter += 1
                }else{
                    counter = 0
                    player = cell.player
                }
                
                if counter == 4 {
                    return true
                }
            }
            player = nil
            counter = 0
        }
        
        
        return false
    }
    
    func hasDiagonal() -> Bool{
        var count = 0;
        var player: Player?
        var r = 0;
        var c = 3;
        
        var i = r;
        var j = c;
        var finished = false;
        repeat{
            if  player == nil && rows[i].row[j].player != nil {
                player = rows[i].row[j].player
            }
            if  player != nil && rows[i].row[j].player?.playerID == player?.playerID {
                count += 1;
            }else {
                count = 0;
                player = rows[i].row[j].player
            }
            if count==4 {
                return true;
            }
            if i == 5 || j == 6 {
                player = nil
                count = 0
                if(c>0){
                    c -= 1
                    i=0
                }else{
                    r += 1
                    i = r
                }
                j = c
            }else{
                i += 1
                j += 1
            }
            if i == 3 && j == 0 {
                finished=true
            }
        }while(!finished)
        
        count = 0
        player = nil
        r = 0
        c = 3
        
        i = r
        j = c
        finished = false
        repeat{
            
            if player == nil && rows[i].row[j].player != nil {
                player = rows[i].row[j].player
            }
            if player != nil && rows[i].row[j].player?.playerID == player?.playerID {
                count += 1
            }else {
                count = 0
                player = rows[i].row[j].player
            }
            if count==4 {
                return true
            }
            if i == 5 || j == 0 {
                player = nil
                count = 0
                if c < 6 {
                    c += 1
                    i = 0
                }else{
                    r += 1
                    i = r
                }
                j = c
            }else{
                i += 1
                j -= 1
            }
            if i == 3 && j == 6 {
                finished = true
            }
        }while(!finished)
        
        
        
        return false
    }
    
    func hasWon() -> Bool{
        return hasHorizontal() || hasVertical() || hasDiagonal()
    }
    
    func isDraw() -> Bool{
        draw = true
        for cell in board {
            if(cell.player == nil){
                draw = false
                print("NOT")
            }
            
        }
        return draw
    }
    
}

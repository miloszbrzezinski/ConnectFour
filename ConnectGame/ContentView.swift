//
//  ContentView.swift
//  ConnectGame
//
//  Created by Milosz Brzezinski on 30/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    let background = LinearGradient(colors: [.white,.cyan],
                                  startPoint: .top,
                                  endPoint: .bottom)
    
    
    let boardBackground = LinearGradient(colors: [.white,.white],
                                  startPoint: .top,
                                  endPoint: .bottom)
    
    let emptyCellColor = LinearGradient(colors: [.black,.gray],
                                        startPoint: .top,
                                        endPoint: .bottom)
    
    let playerOneCellColor = LinearGradient(colors: [.orange,.orange],
                                            startPoint: .top,
                                            endPoint: .bottom)
    
    let playerTwoCellColor = LinearGradient(colors: [.red,.pink],
                                            startPoint: .top,
                                            endPoint: .bottom)
    
    let layout = [
        GridItem(.fixed(45)),
        GridItem(.fixed(45)),
        GridItem(.fixed(45)),
        GridItem(.fixed(45)),
        GridItem(.fixed(45)),
        GridItem(.fixed(45)),
        GridItem(.fixed(45))
    ]
    
    let playerOne = Player(name: "Player One", id: 1)
    let playerTwo = Player(name: "Player Two", id: 2)
    
    
    @ObservedObject var cell: Cell = Cell(col: 0, row: 0)
    @ObservedObject var board: Board = Board()
    
    @Binding var mainMenu: Bool
    
    @State var color: LinearGradient?;
    @State var activePlayer: Player?
    @State var activePlayerID: Int = 0
    @State var placesLeft: Int = 6
    @State var placesLeft1: Int = 6
    @State var placesLeft2: Int = 6
    @State var placesLeft3: Int = 6
    @State var placesLeft4: Int = 6
    @State var placesLeft5: Int = 6
    @State var placesLeft6: Int = 6
    @State var placesLeft7: Int = 6
    @State var cellView: PlacingButton?
    @State var playerColor: LinearGradient = LinearGradient(colors: [.orange,.orange], startPoint: .top, endPoint: .bottom)
    @State var endGame: Bool = false
    @State var draw: Bool = false
    
    @State var headerSize: CGFloat? = 200
    
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            background
                .ignoresSafeArea()
                .opacity(0.6)
            VStack {
                ZStack{
                    boardBackground
                        .ignoresSafeArea()
                        .frame(height: 30)
                        .opacity(0.2)
                    HStack{
                        Button(action: {
                            self.restartGame()
                            mainMenu = false
                        }, label: {
                            HStack{
                                Image(systemName: "chevron.backward")
                                    .resizable()
                                    .frame(width: 20.0, height: 30.0, alignment: Alignment.leading)
                                    .padding(.leading, 20)
                            }
                            Text("Menu")
                                .font(.system(size: 20, weight: .bold))
                        })
                        Spacer()
                    }
                }
//
                    VStack{
                        if let name = activePlayer?.name{
                            if endGame{
                                if draw{
                                    Text("DRAW").foregroundStyle(playerColor)
                                        .font(.system(size: 50, weight: .bold))
                                }else{
                                    Text("WINNER").foregroundStyle(playerColor)
                                        .font(.system(size: 50, weight: .bold))
                                    Text(name).foregroundStyle(playerColor)
                                        .font(.system(size: 50, weight: .bold))
                                }
                            }else{
                                Text(name).foregroundStyle(playerColor)
                                    .font(.system(size: 50, weight: .bold))
                            }
                        }
                    }
                
                
                Spacer()
                
                ZStack{
                    boardBackground
                        .opacity(0.70)
                        .ignoresSafeArea()
                        .frame(height: 350)
                        .cornerRadius(15)
                    
                    LazyVGrid(columns: layout) {
//                        if let displayBoard = board.board{
                        ForEach(board.board) { c in
                                CellView(cell: c)
                            }
//                        }
                        
                    }
                }
                .padding([.leading, .trailing], 7)
                Spacer()
                if !endGame{
                    ZStack{
                        boardBackground
                            .opacity(0.70)
                            .ignoresSafeArea()
                            .frame(height: 60)
                            .cornerRadius(15)
                        
                        HStack{
                            PlacingButton(colorID: $activePlayerID, placesLeft: $placesLeft1)
                                .onTapGesture {
                                    addOn(position: 1)
                                }
                            PlacingButton(colorID: $activePlayerID, placesLeft: $placesLeft2)
                                .onTapGesture {
                                    addOn(position: 2)
                                }
                            PlacingButton(colorID: $activePlayerID, placesLeft: $placesLeft3)
                                .onTapGesture {
                                    addOn(position: 3)
                                }
                            PlacingButton(colorID: $activePlayerID, placesLeft: $placesLeft4)
                                .onTapGesture {
                                    addOn(position: 4)
                                }
                            PlacingButton(colorID: $activePlayerID, placesLeft: $placesLeft5)
                                .onTapGesture {
                                    addOn(position: 5)
                                }
                            PlacingButton(colorID: $activePlayerID, placesLeft: $placesLeft6)
                                .onTapGesture {
                                    addOn(position: 6)
                                }
                            PlacingButton(colorID: $activePlayerID, placesLeft: $placesLeft7)
                                .onTapGesture {
                                    addOn(position: 7)
                                }
                        }
                        
                    }
                    .padding([.leading, .trailing], 5)
                    
                }else{
                    VStack{
                        Button(action: {
                            self.restartGame()
                        }, label: {
                            MenuButton(text: "Play again")
                        })
                        Button(action: {
                            self.restartGame()
                            mainMenu = false
                        }, label: {
                            MenuButton(text: "Exit to menu")
                        })
                        
                    }
                }
            }
            
            .onAppear(){
                activePlayer = playerOne
                activePlayerID = activePlayer!.playerID
                updateLeftCells()
            }
        }
    }
    
    func updateLeftCells(){
        placesLeft1 = board.columns[0].getEmptyCells()
        placesLeft2 = board.columns[1].getEmptyCells()
        placesLeft3 = board.columns[2].getEmptyCells()
        placesLeft4 = board.columns[3].getEmptyCells()
        placesLeft5 = board.columns[4].getEmptyCells()
        placesLeft6 = board.columns[5].getEmptyCells()
        placesLeft7 = board.columns[6].getEmptyCells()
    }
    
    func addOn(position pos: Int){
        if board.columns[pos - 1].getEmptyCells() != 0 {
            board.placeCounter(position: pos, player: activePlayer!)
            endGame = board.endGame
            draw = board.draw
            if !endGame{
                if activePlayer?.playerID == 1{
                    activePlayer = playerTwo
                    activePlayerID = activePlayer!.playerID
                    playerColor = playerTwoCellColor
                }else{
                    activePlayer = playerOne
                    activePlayerID = activePlayer!.playerID
                    playerColor = playerOneCellColor
                }
            }
        }
        updateLeftCells()
    }
    
    func restartGame(){
        board.restartGame()
        endGame = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(mainMenu: .constant(false))
    }
}

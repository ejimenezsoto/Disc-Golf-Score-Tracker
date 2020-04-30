//
//  GameControlelr.swift
//  Disc Golf Tracker
//
//  Created by Enzo Jimenez-Soto on 4/29/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import Foundation

class GameController {
    private (set) var games: [Game] = []
    
    init () {
    }
    
    //CRUD
    //MARK : - Public Methods
    //Create
    @discardableResult public func addGame(game: Game) -> Game {
        games.append(game)
       saveToPersistentStore()
        return game
    }
    @discardableResult public func addGame(name: String, numPlayers: Int, numHoles: Int) -> Game {
        let game = Game(numHoles: numHoles, numPlayers: numPlayers, name: name)
        games.append(game)
       saveToPersistentStore()
        return game
    }
    
    //Read?
    //Update?
    func updateStrokes(for hole: Hole, player: Int, game: Game, strokes: Int) {
        guard let gameIndex = games.firstIndex(of: game),
            let holeIndex = games[gameIndex].holes.firstIndex(of: hole) else { return }
        games[gameIndex].holes[holeIndex].strokes[player] = strokes
    }
    
    //Delete?
    
    //MARK: - Persistent Store
    
       var persistentFileURL: URL? {
           
           let fileManager = FileManager.default
           
           let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
           
           let discGolfURL = documentsDir?.appendingPathComponent("discGolfTracker.plist")
           
           return discGolfURL
       }
       
       func saveToPersistentStore() {
           
           do {
               
               let encoder = PropertyListEncoder()
               
               // Convert the [Star] into plist
               let discGolfTrackerPlist = try encoder.encode(games)
               
               // Make sure the location we are saving the stars to exists
               guard let persistentFileURL = persistentFileURL else {
                   return
               }
               
               // Save the plist to the location we chose
               try discGolfTrackerPlist.write(to: persistentFileURL)
               
           } catch {
               // Handle the error that gets "thrown" here
               print("Error saving Disc Golf Game: \(error)")
               
           }
       }
           func loadFromPersistentStore() {
               
               //make sure the file url exists
               guard let peristentFileURL = persistentFileURL else { return }
               
               do {
                   let decoder = PropertyListDecoder()
                   
                   // URL -> DATA -> [STAR]
                   
                 //Grab the data (stars.plist) from the persistentFileURL
                   
                   let discGolfTrackerPlist = try Data(contentsOf: peristentFileURL)
                   
                   let games = try decoder.decode([Game].self, from: discGolfTrackerPlist)
                   
                   self.games = games
               
                   } catch {
                   print("Error loading game from plist: \(error)")
               }
           
           }
       
       }



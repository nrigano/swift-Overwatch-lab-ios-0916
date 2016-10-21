//
//  Game.swift
//  Overwatch
//
//  Created by Nick Rigano on 10/21/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

struct Game {
    var offenseCharacters: [Hero] = []
    var defenseCharacters: [Hero] = []
    var supportCharacters: [Hero] = []
    var tankCharacters: [Hero] = []
    var heroType: HeroType = .offense
    var heroes: [Hero] {
        return heroesForType()
    }
    
    init() {
        self.createAllHeroes()
    }

}

extension Game {
    mutating func createAllHeroes() {
        for i in HeroType.allTypes {
            let heroArray = HeroName.heroes(with: i)
            for i in heroArray {
                let hero = Hero(name: i)
                switch hero.heroType {
                case .offense: offenseCharacters.append(hero)
                case .defense: defenseCharacters.append(hero)
                case .support: supportCharacters.append(hero)
                case .tank: tankCharacters.append(hero)
                }
            }
            
        }
    }
    
    func heroesForType() -> [Hero] {
        switch self.heroType {
        case .offense:
            return offenseCharacters
        case .defense:
            return defenseCharacters
        case .support:
            return supportCharacters
        case .tank:
            return tankCharacters
        }
    }
    
    
}





//Ultimately this function needs to create instances of every single character.


//Here's the tools you have available to you (tools that you implemented above).
//HeroType.alltypes should return back to you an array of all the types of heroes.
//HeroName.heroes(with:) takes in as an argument an instance of type HeroType which will return back an array of all the hero names of type HeroName for that particular HeroType.
//In creating an instance of Hero, it takes in as an argument through its initializer an instance of HeroName.
//You should create every hero (instances of Hero) and after creating them, appending them to the correct array.
//The arrays we have to work with on this type are offenseCharacters, defenseCharacters, tankCharacters and supportCharacters so make sure you're appending the Hero instance to the correct array based upon their type.

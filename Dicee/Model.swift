//
//  Model.swift
//  Dicee
//
//  Created by Nikita on 22.03.2026.
//

struct Dicee {
    
    let number: Int
    let imageName: String
    
    static func getDiceArray() -> [Dicee] {
        let array: [Dicee] = [
            Dicee(number: 1, imageName: "DiceOne"),
            Dicee(number: 2, imageName: "DiceTwo"),
            Dicee(number: 3, imageName: "DiceThree"),
            Dicee(number: 4, imageName: "DiceFour"),
            Dicee(number: 5, imageName: "DiceFive"),
            Dicee(number: 6, imageName: "DiceSix")
        ]
        return array
    }
    
}



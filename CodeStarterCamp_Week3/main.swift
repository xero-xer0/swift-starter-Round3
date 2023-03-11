//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    let name: String
    var age: Int
    var money: Int
    
    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }
    
    mutating func buyCoffee(Coffee: CoffeeMenu) {
        print(Coffee.rawValue + " 주세요.")
        
        if let coffeePrice = yagombucks.menu[Coffee.rawValue] {
            self.money -= coffeePrice
            print(name + "의 남은 돈:\(money)\n")
        } else {
            print("nil")
        }
    }
}

enum CoffeeMenu: String {
    case americano = "아메리카노", latte = "라떼", iceTea = "아이스티"
}

struct CoffeeShop {
    var barister: Person
    var income: Int
    let menu: Dictionary<String, Int>
    var pickUpTable = Array<String>()
    
    init(barister: Person, income: Int, menu: Dictionary<String, Int>) {
        self.barister = barister
        self.income = income
        self.menu = menu
    }
    
    mutating func giveCoffee(orderedCoffee: CoffeeMenu) {
        print(orderedCoffee.rawValue + " 주문 받았습니다.")
        
        if let coffeePrice = self.menu[orderedCoffee.rawValue] {
            self.income += coffeePrice
            print("카페 수익:\(income)")
        } else {
            print("nil")
        }
        
        pickUpTable.append(orderedCoffee.rawValue)
        print("\(pickUpTable.joined(separator: ", ")) 픽업대에 나와있습니다.")
    }
}


var misterLee = Person(name: "이땡떙", age: 24, money: 40000)
var missKim = Person(name: "김떙떙", age: 28, money: 900000)
var yagombucks = CoffeeShop(barister: misterLee, income: 0, menu: ["아메리카노": 2000, "라떼": 2500, "아이스티": 3000])

missKim.buyCoffee(Coffee: .latte)
yagombucks.giveCoffee(orderedCoffee: .latte)

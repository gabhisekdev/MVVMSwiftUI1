//
//  DataProvider.swift
//  MVVMSwiftUIDemo1
//
//  Created by G Abhisek on 21/01/21.
//

import Foundation

protocol DataProvidable {
    func getSuperHeroesListing(of universe: ComicsUniverse) -> [SuperHero]
}

class DataProvider: DataProvidable {
    func getSuperHeroesListing(of universe: ComicsUniverse) -> [SuperHero] {
        switch universe {
        case .dc:
           return [SuperHero(name: "Batman", imageName: "batman"), SuperHero(name: "Superman", imageName: "superman"), SuperHero(name: "Wonderwoman", imageName: "wonderwoman"), SuperHero(name: "Aquaman", imageName: "aquaman")]
        case .marvel:
            return [SuperHero(name: "Ironman", imageName: "ironman"), SuperHero(name: "Thor", imageName: "thor"), SuperHero(name: "Captain America", imageName: "captainamerica"), SuperHero(name: "Hulk", imageName: "hulk")]
        }
    }
}

enum ComicsUniverse {
    case dc
    case marvel
}

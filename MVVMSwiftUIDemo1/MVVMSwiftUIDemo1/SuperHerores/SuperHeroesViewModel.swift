//
//  SuperHeroesViewModel.swift
//  MVVMSwiftUIDemo1
//
//  Created by G Abhisek on 22/01/21.
//

import SwiftUI
import Combine

final class SuperHeroesViewModel: ObservableObject {
    @Published var selectedUniverse: ComicsUniverse?
    var superHeroes: [SuperHero] = []
    
    private let dataProvider: DataProvidable
    private var subscriptions = Set<AnyCancellable>()
    
    init(dataProvider: DataProvidable = DataProvider()) {
        self.dataProvider = dataProvider
        setupSubscriptions()
    }
    
    private func setupSubscriptions() {
        $selectedUniverse
            .removeDuplicates()
            .compactMap{ $0 }
            .sink { [weak self] in
                guard let self = self else { return }
                self.superHeroes = self.dataProvider.getSuperHeroesListing(of: $0)
            }
            .store(in: &subscriptions)
    }
}

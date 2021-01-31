//
//  MVVMSwiftUIDemo1App.swift
//  MVVMSwiftUIDemo1
//
//  Created by G Abhisek on 18/01/21.
//

import SwiftUI

@main
struct MVVMSwiftUIDemo1App: App {
    var body: some Scene {
        WindowGroup {
            SuperHeroesView(viewModel: SuperHeroesViewModel())
        }
    }
}

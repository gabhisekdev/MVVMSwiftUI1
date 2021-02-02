//
//  SuperHeroesView.swift
//  MVVMSwiftUIDemo1
//
//  Created by G Abhisek on 18/01/21.
//

import SwiftUI

struct SuperHeroesView: View {
    
    @ObservedObject var viewModel: SuperHeroesViewModel
    let columns = Array.init(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                if viewModel.selectedUniverse != nil {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(viewModel.superHeroes, id: \.self) { hero in
                                VStack {
                                    Image(hero.imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100)
                                    Text(hero.name)
                                        .font(.callout)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                Text("Which hero universe you wanna enter?")
                    .font(.headline)
                
                HStack {
                    Button("DC") {
                        viewModel.selectedUniverse = .dc
                    }
                    .foregroundColor(viewModel.selectedUniverse == .dc ? Color.white : Color.blue)
                    .padding(8)
                    .background(viewModel.selectedUniverse == .dc ? Color.blue : Color.clear)
                    .clipShape(Capsule())
                    
                    Spacer()
                    
                    Button("Marvel") {
                        viewModel.selectedUniverse = .marvel
                    }
                    .foregroundColor(viewModel.selectedUniverse == .marvel ? Color.white : Color.blue)
                    .padding(8)
                    .background(viewModel.selectedUniverse == .marvel ? Color.blue : Color.clear)
                    .clipShape(Capsule())
                }
                
            }
            .padding()
            .navigationTitle("Superhero Showdown")
        }
        
    }
}

struct SuperHeroesView_Previews: PreviewProvider {
    static var previews: some View {
        SuperHeroesView(viewModel: SuperHeroesViewModel())
    }
}

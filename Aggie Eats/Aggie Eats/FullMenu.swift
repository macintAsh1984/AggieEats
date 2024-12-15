//
//  FullMenu.swift
//  Aggie Eats
//
//  Created by Ashley Valdez on 11/30/24.
//

import SwiftUI

struct FullMenu: View {
    let menu: [Menu] = Bundle.main.decode("Menu.json")
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Weekly Menu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom)
                ForEach(menu, id: \.self) { menuOption in
                    VStack(alignment: .leading) {
                        Text(menuOption.day)
                            .font(.title2)
                            .fontWeight(.bold)
                        TodaysMenuOptionsView(menuItems: menuOption.menu)
                    }
                    .padding(.bottom)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    FullMenu()
}

//
//  BottomPageNav.swift
//  Aggie Eats
//
//  Created by Ashley Valdez on 11/30/24.
//

import SwiftUI

struct BottomPageNav: View {
    var body: some View {
        TabView {
            Tab("Today", systemImage: "star.fill") {
                ContentView()
            }
        }
    }
}

#Preview {
    BottomPageNav()
}

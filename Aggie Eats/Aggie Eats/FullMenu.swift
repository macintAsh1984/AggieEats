//
//  FullMenu.swift
//  Aggie Eats
//
//  Created by Ashley Valdez on 11/30/24.
//

import SwiftUI

struct FullMenu: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Monday")
                    .font(.title2)
                    .fontWeight(.bold)
                //TodaysMenuOptionsView()
                Text("Tuesday")
                    .padding(.top)
                    .font(.title2)
                    .fontWeight(.bold)
                //TodaysMenuOptionsView()
                Text("Wednesday")
                    .padding(.top)
                    .font(.title2)
                    .fontWeight(.bold)
                //TodaysMenuOptionsView()
                Text("Thursday")
                    .padding(.top)
                    .font(.title2)
                    .fontWeight(.bold)
               // TodaysMenuOptionsView()
                Text("Friday")
                    .padding(.top)
                    .font(.title2)
                    .fontWeight(.bold)
                //TodaysMenuOptionsView()
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    FullMenu()
}

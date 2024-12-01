//
//  ContentView.swift
//  Aggie Eats
//
//  Created by Ashley Valdez on 11/28/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State var location = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 38.54141, longitude: -121.74845),
            span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        )
    )
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Today's Location")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("Memorial Union")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                
                TruckLocationView()
                TodaysMenuView()
                
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

struct TruckLocationView: View {
    var body: some View {
        Map {
            Marker("MU", coordinate: CLLocationCoordinate2D(latitude: 38.54141, longitude: -121.74845))
        }
        .frame(width: 370, height: 400)
        .padding(.bottom)
    }
}

struct TodaysMenuView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("What's On The Menu?")
                .font(.title)
                .fontWeight(.bold)
            TodaysMenuOptionsView()
        }
    }
}

struct TodaysMenuOptionsView: View {
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("Menu Options Color"))
                .frame(height: 100)
            VStack(alignment: .leading) {
                Text("Chicken Bowl")
                    .font(.title3)
                    .fontWeight(.semibold)
                Text("Out of Stock")
                    .fontWeight(.medium)
                    .foregroundColor(Color.red)
                
            }
            .padding()
        }
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("Menu Options Color"))
                .frame(height: 100)
            VStack(alignment: .leading) {
                Text("Hummus & Cucumber Sandwich")
                    .font(.title3)
                    .fontWeight(.semibold)
                Text("Limited Availability")
                    .fontWeight(.medium)
                    .foregroundColor(Color.yellow)
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

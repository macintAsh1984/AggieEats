//
//  ContentView.swift
//  Aggie Eats
//
//  Created by Ashley Valdez on 11/28/24.
//

import SwiftUI
import MapKit
import CodeScanner

struct ContentView: View {
    @State var location = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 38.54141, longitude: -121.74845),
            span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        )
    )
    @State var showScanner = false
    @State var navigateToOrderingPage = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Today's Location")
                                .font(.title2)
                                .fontWeight(.bold)
                            Spacer()
                            ScanQrCodeButton(showScanner: $showScanner)
                        }
                        Text("Memorial Union")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                    
                    TruckLocationView()
                    TodaysMenuView()
                    
                }
            }
            .sheet(isPresented: $showScanner) {
                CodeScannerView(codeTypes: [.qr], simulatedData: "7A04A", completion: handleScan)
            }
            .navigationDestination(isPresented: $navigateToOrderingPage) {
                OrderingView()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
       showScanner = false
        switch result {
        case .success(let result):
            navigateToOrderingPage = true
            
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
}


struct ScanQrCodeButton: View {
    @Binding var showScanner: Bool
    var body: some View {
        Button {
            showScanner = true
        } label: {
            Image(systemName: "camera")
                .imageScale(.large)
        }
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

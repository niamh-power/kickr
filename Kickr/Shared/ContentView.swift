//
//  ContentView.swift
//  Shared
//
//  Created by Niamh Power on 07/02/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
        ZStack {
            Rectangle()
                .fill(Color("Background"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 16) {
                TimerView()
                KickCountView()
            }
        }
        .navigationTitle("Kickr")
        .navigationBarTitleDisplayMode(.inline)
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

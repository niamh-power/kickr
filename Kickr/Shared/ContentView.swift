//
//  ContentView.swift
//  Shared
//
//  Created by Niamh Power on 07/02/2023.
//

import SwiftUI

struct Session: Identifiable {
    let id = UUID()
    let count: Int
    let duration: Double
    let date: Date
}

struct ContentView: View {
    @State var count = 0
    @State var duration = 0.0
    @State var sessions: [Session] = []
    
    var body: some View {
        NavigationView {
        ZStack {
            Rectangle()
                .fill(Color("Background"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 30) {
                TimerView(duration: self.$duration)
                KickCountView(count: self.$count)
                Button {
                    sessions.append(Session(count: count, duration: duration, date: Date()))
                } label: {
                    Text("Save Session")
                }
                
                ForEach(sessions) { session in
                    Text("\(session.count) kicks")
                }
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

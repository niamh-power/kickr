//
//  MainView.swift
//  Kickr (iOS)
//
//  Created by Niamh Power on 12/03/2023.
//

import Foundation
import SwiftUI

struct Session: Identifiable, Equatable {
    let id = UUID()
    var count: Int
    var duration: Double
    var isActive: Bool
    let date: Date
}

struct MainView: View {
    @State var sessions: [Session] = []
    @State var currentSession: Session = Session(count: 0, duration: 0, isActive: false, date: Date())
        
    var body: some View {
        NavigationView {
        ZStack {
            Rectangle()
                .fill(Color("Background"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 30) {
                TimerView(currentSession: self.$currentSession)
                KickCountView(currentSession: self.$currentSession)
                Button {
                    sessions.append(currentSession)
                    currentSession = Session(count: 0, duration: 0, isActive: false, date: Date())
                    
                                    } label: {
                    Text("Save Session")
                }
                
                ForEach(sessions) { session in
                    Text("\(session.count) kicks, \(session.duration.hourMinuteSecondMS)")
                }
            }
        }
        .navigationTitle("Kickr")
        .navigationBarTitleDisplayMode(.inline)
    }
    }
}

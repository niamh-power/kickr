//
//  TimerView.swift
//  Kickr (iOS)
//
//  Created by Niamh Power on 07/02/2023.
//

import SwiftUI

struct TimerView: View {
    @State private var isRunning = false
    @State private var timerString = "0.00"
    @State private var start = Date()
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @Binding var currentSession: Session
    
    var body: some View {
        Text(self.timerString)
            .onChange(of: currentSession) { session in
                if (!session.isActive) {
                    self.stopTimer()
                }
            }
            .font(Font.system(.largeTitle, design: .monospaced))
            .onReceive(timer) { _ in
                if self.isRunning {
                    currentSession.duration = Date().timeIntervalSince(self.start)
                    timerString = String(format: "%.2f", (Date().timeIntervalSince(self.start)))
                }
            }
            .onTapGesture {
                if isRunning {
                    self.stopTimer()
                } else {
                    timerString = "0.00"
                    start = Date()
                    // start UI updates
                    self.startTimer()
                }
                isRunning.toggle()
            }
    }
    
    func stopTimer() {
        timerString = "0.00"
        self.timer.upstream.connect().cancel()
    }
    
    func startTimer() {
        currentSession.isActive = true
        self.timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    }
    
    func resetTimer() {
        
    }
}

//
//  TimerView.swift
//  Kickr (iOS)
//
//  Created by Niamh Power on 07/02/2023.
//

import SwiftUI

struct TimerView: View {
    @State var isRunning = false
    @State private var timerString = "0.00"
    @State private var start = Date()
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text(self.timerString)
            .font(Font.system(.largeTitle, design: .monospaced))
            .onReceive(timer) { _ in
                if self.isRunning {
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
            }.onAppear() {
                self.stopTimer()
            }
    }
    
    func stopTimer() {
        self.timer.upstream.connect().cancel()
    }
    
    func startTimer() {
        self.timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    }
}

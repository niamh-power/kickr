//
//  KickCountView.swift
//  Kickr (iOS)
//
//  Created by Niamh Power on 07/02/2023.
//

import Foundation
import SwiftUI

// https://anthonycodesofficial.medium.com/swiftui-tutorial-how-to-create-a-circle-button-using-neumorphic-design-5a1aa40bb14b

struct KickCountView: View {
    @State var count = 0
    @State var buttonTapped = false
    @State var buttonPressed = false
    let impact = UIImpactFeedbackGenerator(style: .soft)

    var body: some View {
        VStack(alignment: .center, spacing: 50) {
            Text("Count: \(count)")
            ZStack {
                Image(systemName: "plus")
                    .font(.system(size: 40, weight: .light))
                    .offset(x: buttonPressed ? -90 : 0, y: buttonPressed ? -90 : 0)
                    .rotation3DEffect(Angle(degrees: buttonPressed ? 20 : 0), axis: (x: 10, y: -10, z: 0))
            }
            .frame(width: 60, height: 60)
            .background(
                ZStack {
                    Circle()
                        .fill(Color("Background"))
                        .frame(width: 100, height: 100)
                        .shadow(color: Color("LightShadow"), radius: 8, x: -8, y: -8)
                        .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8)
                }
            )
            .scaleEffect(buttonTapped ? 1.1 : 1)
            .onTapGesture(count: 1) {
                impact.impactOccurred()
                count += 1
                self.buttonTapped.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.buttonTapped = false
                }
            }
        }
    }
}

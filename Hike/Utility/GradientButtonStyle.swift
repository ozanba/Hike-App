//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Ozan Bağıran on 1/30/24.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
                .padding(.horizontal, 30)
                .background(
                    //Conditional Statement with Nil Coalescing
                    //condition A?B
                    configuration.isPressed ?
                    // A: when user pressed button
                    
                    LinearGradient(colors: [
                    .colorGrayMedium,
                    .colorGrayLight],
                    startPoint: .top,
                    endPoint: .bottom)
                    
                    //B:  when button not pressed
                    :
                    LinearGradient(colors: [
                    .colorGrayLight,
                    .colorGrayMedium],
                    startPoint: .top,
                    endPoint: .bottom)
            ).cornerRadius(40)
    }
}

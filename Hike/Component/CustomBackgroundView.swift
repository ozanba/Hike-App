//
//  CustomBackgorungView.swift
//  Hike
//
//  Created by Ozan Bağıran on 1/30/24.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            //MARK: - 3. DEPTH
            
            Color.customGreenDark
                .cornerRadius(40)
                .offset(y:12)
            
            //MARK: - 2. LIGHT
            Color.customGreenLight
                .cornerRadius(40)
                .offset(y:3)
                .opacity(0.85)
            
            //surface
            LinearGradient(colors:[
                .customGreenLight,
                .customGreenMedium],
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
            
        }
        .cornerRadius(40)
        
    }
}

#Preview {
    CustomBackgroundView()
}

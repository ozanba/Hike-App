//
//  CardView.swift
//  Hike
//
//  Created by Ozan Bağıran on 1/30/24.
//

import SwiftUI

struct CardView: View {
    //MARK: - PROPERTIES
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    //MARK: - FUNCTIONS
    
    func randomImage(){
        randomNumber = Int.random(in: 1...5)
        if randomNumber == imageNumber{
            randomImage()}
        else{
            imageNumber = randomNumber}
    }

    var body: some View {
        //MARK: - CARD
        ZStack {
            CustomBackgroundView()
            
            VStack {
                VStack(alignment: .leading ){
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(LinearGradient(colors: [
                                .customGrayLight,
                                .customGrayMedium
                            ], startPoint: .top, endPoint: .bottom))
                        
                        Spacer()
                        
                        Button{
                            print("Button Pressed!!!")
                            isShowingSheet.toggle()
                            
                        }label:{
                            CustomButtonView()
                        }.sheet(isPresented: $isShowingSheet){
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                    }
                    Text("Fun and enjoyable activity for friends and families").multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/).italic().foregroundColor(.customGrayMedium)}
                .padding(.horizontal,30)
                //MARK: MAIN CONTENT
                ZStack {
                    CustomCircleView()
                   
                    //MARK: IMAGE
                    Image("image-\(imageNumber)").resizable().scaledToFit().animation(.default, value: imageNumber)//image number değiştiriğinde animation çalışır.
                }
                
    
                Button{
                    print("The button was pressed!")
                    randomImage()
                }label:{
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient (colors: [.customGreenLight, .customGreenMedium], startPoint: .top, endPoint: .bottom))
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.35), radius: 0.25,x:1, y: 2 )
                        
                }.buttonStyle(GradientButton())
            }
            
                
            }
            .frame(width: 320, height: 570)
        
    }
}

#Preview {
    CardView()
}

//
//  SettingsView.swift
//  Hike
//
//  Created by Ozan Bağıran on 1/31/24.
//

import SwiftUI

struct SettingsView: View {
    
    private let altarnateAppIcons: [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Campfire"
    ]
    
    var body: some View {
        
        
        
        List() {
            //MARK: - SECTION: HEADER
            Section{
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading").font(.system(size: 80, weight: .black))
                    
                    VStack (spacing: -10){
                        Text("Hike").font(.system(size:66, weight: .black))
                        Text("Editors' Choice").fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing").font(.system(size: 80, weight: .black))
                    Spacer()
                }.foregroundStyle(LinearGradient (colors: [.customGreenLight, .customGreenMedium], startPoint: .top, endPoint: .bottom))
                    .padding(.top,8)
                VStack(spacing: 8) {
                    Text("Where can you find \nperfect tracks?").font(.title2).fontWeight(.heavy)
                
                
                Text("The hike is looks gorgeus in photos but it is even better when you are actualy there. The hike that you hope to do again someday.\nFind the best day hikes in the app ").font(.footnote).italic()
                    
                    Text("Dusts of the boots! It's time for a walk").fontWeight(.heavy).foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 8)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }//: HEADER
            .listRowSeparator(.hidden)
            
            //MARK: - SECTION: ICONS
            
            Section(header: Text("Alternate Icons")){
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 12){
                        ForEach(altarnateAppIcons.indices, id:\.self) {item in
                            Button{
                                print("Icon \(altarnateAppIcons[item]) was pressed")
                                
                                UIApplication.shared.setAlternateIconName(altarnateAppIcons[item]){
                                    error in
                                    if error != nil{
                                        print("Failed request to update icon: \((String(describing: error?.localizedDescription))) ")
                                    }
                                    else{
                                        print("Sucsess You have changed the app's icon to \(altarnateAppIcons[item])")
                                    }
                                }

                                
                            } label:{
                                Image("\(altarnateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                            .buttonStyle(.borderless)
                        }
                        
                    }
                }//: SCROLLVIEW
                .padding(.top,12)
                Text("Chose your favorite app icon from the collection above")
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 8)
                
            }
            
            //MARK: - SECTION: ABOUT
            
                Section( header: Text("ABOUT THE APP"),
                         footer: 
                            HStack {
                    Spacer()
                    Text("CopyRight © All right reserved")
                    Spacer()
                }
                ){
                    
                    // 1. Basic Labeled Content
                    //LabeledContent("Application",value:"Hike")
                    
                    //2. Advenced Labeled COntent
                    
                    CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor:  .blue)
                    
                    CustomListRowView(rowLabel: "Compability", rowIcon: "info.circle", rowContent: "IOS,IpadOS ", rowTintColor: .red)
                    
                    CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                    
                    CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                    
                    CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent:"Ozan Bağıran" , rowTintColor: .mint)
                    
                    CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent:"Ozan Bagiran" , rowTintColor: .pink)
                    
                    
                    CustomListRowView(rowLabel: "Youtube", rowIcon: "globe",rowContent: nil, rowTintColor: .indigo, rowLinkLabel: "Ozan Bagiran", rowLinkDestination: "https://www.youtube.com/@ozba")
                }
            
            
            
            
        }
        
    }
}

#Preview {
    SettingsView()
}

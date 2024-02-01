//
//  CustomListRowView.swift
//  Hike
//
//  Created by Ozan Bağıran on 2/1/24.
//

import SwiftUI

struct CustomListRowView: View {
    //MARK: PROPETIES
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    var body: some View {
        LabeledContent{
            if rowContent != nil {
                Text(rowContent!).fontWeight(.heavy).foregroundStyle(.primary)
            } else if (rowLinkLabel != nil && rowLinkDestination != nil) {
                Link(rowLinkLabel!,destination: URL(string: rowLinkDestination!)!)
            }
            else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        } label: {
            HStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30,height: 30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
            Text(rowLabel)
        }}
    }
}

#Preview {
    List {
        CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent:"Ozan Bagiran" , rowTintColor: .pink)
        CustomListRowView(rowLabel: "Youtube", rowIcon: "globe",rowContent: nil, rowTintColor: .pink, rowLinkLabel: "Ozan Bagiran", rowLinkDestination: "www.youtube.com/OZBA")
    }
}

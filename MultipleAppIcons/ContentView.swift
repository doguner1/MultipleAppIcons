//
//  ContentView.swift
//  MultipleAppIcons
//
//  Created by qwerty on 13.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode: String = "Default"
    @State private var isShow = false
    var body: some View {
        VStack {
            ForEach(1...10, id: \.self) { _ in
                VStack(alignment: .leading, spacing: 6) {
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(.gray.opacity(0.15))
                        .frame(height: 25)
                    
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(.gray.opacity(0.15))
                        .frame(height: 15)
                        .padding(.trailing, 50)
                    
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(.gray.opacity(0.15))
                        .padding(.trailing, 150)
                }
            }
        }.overlay(
            GeometryReader{ geometry in
                Button {
                    isShow.toggle()
                } label: {
                    Image(systemName: "gear")
                        .font(.system(size: 35))
                }.sheet(isPresented: $isShow, content: {
                    Settings()
                }).position(x: geometry.size.width - 20 , y: geometry.size.height - 40)
                
            }
        )
        .padding(.horizontal, 25)
       .preferredColorScheme(isDarkMode == "Karanlık" ? .dark : .light)
    }
}

#Preview {
    ContentView()
}

/*
 
 var body: some View {
 NavigationStack{
 //            Picker(selection: $activeAppIcon) {
 //                let customIcons: [String] = ["AppIcon 1","AppIcon 2","AppIcon 3","AppIcon 4"]
 //                ForEach(customIcons, id:\.self){ icon in
 //                    Text(icon)
 //                        .tag(icon)
 //                }
 //            }label: {
 //
 //            }.navigationTitle("Alternative App Icon")
 //        }.onChange(of: activeAppIcon) {
 //            UIApplication.shared.setAlternateIconName(activeAppIcon)
 //        }
 }
 }
 
 */

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
            HStack{
                Button("", systemImage: "person") {
                }
                Spacer()
                Button("", systemImage: "camera") {
                }
                Button("", systemImage: "gear") {
                    isShow.toggle()
                }
            }.overlay(
                Text("Sohbetler")
                    .foregroundColor(Color(.label))
            )
            .foregroundColor(Color(.label))
            .font(.system(size: 20))
            
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
        }.sheet(isPresented: $isShow, content: {
            Settings()
        })
        .padding(.horizontal, 25)
        .preferredColorScheme(isDarkMode == "Karanlık" ? .dark : .light)
    }
}

#Preview {
    ContentView()
}



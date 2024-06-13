//
//  Themes.swift
//  MultipleAppIcons
//
//  Created by qwerty on 13.06.2024.
//

import SwiftUI

struct Themes: View {
    @AppStorage("isDarkMode") private var isDarkMode: String = ""
    @AppStorage("index") private var index: Int = 0
    
    var body: some View {
        VStack {
            List {
                Section{
                    
                    Text("Karanlık")
                        .badge(
                            Text(index == 1 ? "✓" : "")
                                .foregroundColor(.blue)
                        )
                        .onTapGesture {
                            index = 1
                            isDarkMode = "Karanlık"
                        }
                    
                    Text("Açık")
                        .badge(
                            Text(index == 2 ? "✓" : "")
                                .foregroundColor(.blue)
                        )
                        .onTapGesture {
                            index = 2
                            isDarkMode = "Aydınlık"
                        }
                }
            }
        }.preferredColorScheme(isDarkMode == "Karanlık" ? .dark : .light)
    }
}

#Preview {
    Themes()
}


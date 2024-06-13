//
//  SelectIcon.swift
//  MultipleAppIcons
//
//  Created by qwerty on 13.06.2024.
//

import SwiftUI

struct Settings: View {
    
    @Environment(\.dismiss) private var dismiss
    @AppStorage("isDarkMode") private var isDarkMode: String = "Default"
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section{
                        
                        Label("Hesap", systemImage: "person")
                        
                        Label("Bağlı Cihazlar", systemImage: "laptopcomputer.and.iphone")
                        NavigationLink(destination: Appearance(navigationTitle: "Görünüm")){
                            Label("Görünüm", systemImage: "sun.min")
                        }
                    }.foregroundColor(Color(.label))
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
                }
            }
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Text("Ayarlar")
                }
                ToolbarItem(placement: .topBarLeading){
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Bitti")
                    }).foregroundColor(Color(.label))
                }
            }
            .padding(.horizontal, 15)
        }.preferredColorScheme(isDarkMode == "Karanlık" ? .dark : .light)
    }
}

#Preview {
    Settings()
}

//
//  Appearance.swift
//  MultipleAppIcons
//
//  Created by qwerty on 13.06.2024.
//

import SwiftUI

struct Appearance: View {
    @Environment(\.presentationMode) var presentationMode
    let navigationTitle: String
    @AppStorage("isDarkMode") private var isDarkMode: String = "Default"
    @AppStorage("active_icon") var activeAppIcon: String = "AppIcon"
    @AppStorage("imageData") var imageData: Data?
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section{
                        NavigationLink(destination: Themes()){
                            Text("Tema")
                                .badge(
                                    Text(isDarkMode)
                                        .italic()
                                )
                        }
                        Text("Sohbet Rengi ve Duvar Kağıdı")
                        NavigationLink(destination: AppIconView()){
                            Text("Uygulama Simgesi")
                                .overlay(
                                    GeometryReader{ geometry in
                                        if let imageData = imageData, let uiImage = UIImage(data: imageData){ //imageDate doluluk kontrolünden sonra, datadaki veriyi image haline çevirirek çıktı alıyoruz
                                            Image(uiImage: uiImage)
                                                .resizable()
                                                .frame(width: 40,height: 40)
                                                .position(x: geometry.size.width + 160,y: geometry.size.height - 9)
                                        }
                                    }
                                )
                        }
                        
                    }
                }
            }
            .navigationBarBackButtonHidden()
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Text(navigationTitle)
                }
                ToolbarItem(placement: .topBarLeading){
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                    })
                }
            }
        }.preferredColorScheme(isDarkMode == "Karanlık" ? .dark : .light)
    }
}

#Preview {
    Appearance(navigationTitle: "Görünüm")
}

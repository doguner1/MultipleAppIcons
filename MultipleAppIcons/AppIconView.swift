//
//  AppIconView.swift
//  MultipleAppIcons
//
//  Created by qwerty on 13.06.2024.
//

import SwiftUI


struct AppIconView: View { //Değişim İşlemi tam olarak burada başlıyor.
    @AppStorage("active_icon") var activeAppIcon: String = "AppIcon"
    @AppStorage("imageData") var imageData: Data?
    var stringDizi = [
    ["fb","gs"],
    ["ts","rm"],
    ["bjk"]
    ]
    var body: some View {
        VStack(){
                ForEach(stringDizi, id:\.self){ ikili in
                    HStack(spacing:15){
                        ForEach(ikili,id:\.self){ biri in
                            Image(uiImage: UIImage(named: biri)!)
                                .resizable()
                                .frame(width: 100,height: 100)
                                .onTapGesture {
                                    imageData = UIImage(named: biri)!.jpegData(compressionQuality: 0.5)
                                    switch biri{
                                    case "fb":
                                        activeAppIcon = "AppIcon 5"
                                    case "gs":
                                        activeAppIcon = "AppIcon 3"
                                    case "ts":
                                        activeAppIcon = "AppIcon 2"
                                    case "rm":
                                        activeAppIcon = "AppIcon 1"
                                    case "bjk":
                                        activeAppIcon = "AppIcon 4"
                                    default:
                                        activeAppIcon = "AppIcon"
                                    }
                                    UIApplication.shared.setAlternateIconName(activeAppIcon)
                                }
                        }.padding().background(Color.primary.opacity(0.06)).cornerRadius(20)
                    }
                }
            VStack{
                HStack{
                    Text("ABC uygulama iconu; Ana Ekran'da, bildirimlerde ve Uygulama Kitaplığında görünecektir")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Spacer()
                }.frame(maxWidth: .infinity)
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    AppIconView()
}

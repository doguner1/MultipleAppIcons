//
//  MultipleAppIconsApp.swift
//  MultipleAppIcons
//
//  Created by qwerty on 13.06.2024.
//

import SwiftUI

@main
struct MultipleAppIconsApp: App {
    @AppStorage("isFirstLauncher") private var isFirstLauncher: Bool = true
    @AppStorage("imageData") var imageData: Data?
    init(){
        if isFirstLauncher{
            imageData = UIImage(named: "fb")!.jpegData(compressionQuality: 0.5)
            isFirstLauncher = false
        }
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

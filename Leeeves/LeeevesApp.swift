//
//  LeevesApp.swift
//  Leeves
//
//  Created by maciura on 14/01/2024.
//

import SwiftUI
import Firebase


@main
struct LeeevesApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            LoginScreen()
                .preferredColorScheme(.light)
        }
    }
}


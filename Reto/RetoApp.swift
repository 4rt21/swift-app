//
//  TemplateReto451App.swift
//  TemplateReto451
//
//  Created by José Molina on 26/08/25.
//

import SwiftUI

@main
struct RetoApp: App {
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    
    init() {


        
    }

    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                HomeScreen() 
            } else {
                NavigationStack {
                    LoginScreen() 
                }
            }
        }
    }
}

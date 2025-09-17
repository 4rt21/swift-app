//
//  HomeScreen.swift
//  TemplateReto451
//
//  Created by José Molina on 09/09/25.
//

import SwiftUI


struct HomeScreen: View {
    var body: some View {
        TabView {
            NavigationStack {
                ReportsScreen()
            }
            .tabItem {
                Label("Reportes", systemImage: "magnifyingglass")
            }

            NavigationStack {
                Text("Notificaciones")
            }
            .tabItem {
                Label("Notificaciones", systemImage: "bell")
            }

            NavigationStack {
                Text("Agregar")
            }
            .tabItem {
                Label("Agregar", systemImage: "plus.app.fill")
            }

            NavigationStack {
                Text("Estadísticas")
            }
            .tabItem {
                Label("Estadísticas", systemImage: "chart.bar")
            }

            NavigationStack {
                Text("Perfil")
            }
            .tabItem {
                Label("Perfil", systemImage: "person")
            }
        }
    }
}

#Preview {
    HomeScreen()
}

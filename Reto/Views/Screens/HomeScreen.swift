//
//  HomeScreen.swift
//  TemplateReto451
//
//  Created by José Molina on 09/09/25.
//

import SwiftUI

struct HomeScreen: View {
    @State private var searchText: String = ""
    
    //bd
    let categories = ["Electródomesticos", "Muebles", "Ropa", "Electrónica", "Libros", "Juguetes", "Deportes"]
    
    let reports = [
        (
            user: "AnaTrailera300",
            user_image: Image(systemName: "person.circle"),
            title: "Estafa Venta de Coches",
            description: "El sitio detectado simula ser una página de compraventa de automóviles bla bla bla ...",
            report_image: Image(systemName: "photo"),
            category: "Electrodomésticos"
        ),
        (
            user: "JuanPérez",
            user_image: Image(systemName: "person.circle.fill"),
            title: "Alerta de Fraude",
            description: "Página que te estafa <:",
            report_image: Image(systemName: "photo"),
            category: "Muebles"
        )
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer().frame(height: 15)
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Buscar", text: $searchText)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                .padding(8)
                .background(Color(.systemGray5))
                .cornerRadius(15)
                .padding(.horizontal)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(categories, id: \.self) { category in
                                    ComponentCategory(name: category)
                                }
                            }
                            .padding(.horizontal)
                        }
                        .frame(height: 50)
                        
                        
                        VStack(spacing: 20) {
                            ForEach(reports, id: \.title) { report in
                                ComponentReport(
                                    user: report.user,
                                    user_image: report.user_image,
                                    title: report.title,
                                    description: report.description,
                                    report_image: report.report_image
                                )
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                }
            }
        }
    }
}

#Preview {
    HomeScreen()
}

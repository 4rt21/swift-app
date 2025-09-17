//
//  ReportsScreen.swift
//  TemplateReto451
//
//  Created by Arturo Utrilla on 16/09/25.
//

import SwiftUI

struct ReportsScreen: View {
    @State private var searchText = ""
    let items = ["Apple", "Banana", "Cherry", "Date", "Fig", "Grape"]

    var filteredItems: [String] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        NavigationStack {
            List(filteredItems, id: \.self) { item in
                Text(item)
            }
            .navigationTitle("Fruits")
            .searchable(text: $searchText, prompt: "Search fruits")
        }
    }
}

#Preview {
    ReportsScreen()
}

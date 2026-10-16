//
//  ContentView.swift
//  ServiceDeskMobile
//
//  Created by Hind Manouzi (Étudiant) on 2026-10-15.
//

import SwiftUI

struct ContentView: View {
    @State private var sectionSelectionne: Onglet = .accueil
    var body: some View {
        TabView(selection: $sectionSelectionne) {
            Accueil(sectionSelectionne: $sectionSelectionne)
        }
        
    }
}

#Preview {
    ContentView()
}

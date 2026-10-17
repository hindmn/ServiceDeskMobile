//
//  ContentView.swift
//  ServiceDeskMobile
//
//  Created by Hind Manouzi (Étudiant) on 2026-10-15.
//

import SwiftUI

struct ContentView: View {
    let ticketsViewModel: TicketsViewModel
    @State private var sectionSelectionne: Onglet = .accueil
    var body: some View {
        TabView(selection: $sectionSelectionne) {
            AccueilView(
                ticketsViewModel: ticketsViewModel,
                sectionSelectionnee: $sectionSelectionne)
                .tabItem{
                    Label("Accueil", systemImage: "house")
                        .labelStyle(.iconOnly)
                }
                .tag(Onglet.accueil)
            TicketView(ticketsVewModel: ticketsViewModel)
                .tabItem{
                    Label("Tickets", systemImage: "ticket")
                        .labelStyle(.iconOnly)
                        .tag(Onglet.tickets)
                }
                .tag(Onglet.tickets)
            ParametreView()
                .tabItem{
                    Label("Paramètres", systemImage: "gearshape")
                        .labelStyle(.iconOnly)
                }
                .tag(Onglet.parametres)
        }
        .tint(.green)
        
    }
}

#Preview {
    ContentView(ticketsViewModel: TicketsViewModel())
}

//
//  AccueilView.swift
//  ServiceDeskMobile
//
//  Created by Hind Manouzi (Étudiant) on 2026-10-16.
//
import SwiftUI

struct AccueilView: View {
    let ticketsViewModel: TicketsViewModel
    @Binding var sectionSelectionnee: Onglet
    @State private var afficherTicket = false
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Tableau de bord")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.black)
                    ScrollView(.horizontal) {
                        LazyHStack(
                    }
                    
                    Button("Afficher les Tickets") {
                        sectionSelectionnee = .tickets
                    }
                    .buttonStyle(.bordered)
                    .foregroundStyle(.black)
                }
            }
            .navigationTitle("Accueil")
        }
    }
}

#Preview {
    AccueilView(ticketsViewModel: TicketsViewModel(),
                sectionSelectionnee: .constant(.accueil))
}

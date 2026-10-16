//
//  ListeTicketsView.swift
//  ServiceDeskMobile
//
//  Created by Hind Manouzi (Étudiant) on 2026-10-16.
//
import SwiftUI

struct ListeTicketsView: View {
    var body: some View {
        NavigationStack {
            Text("Liste des tickets")
                .foregroundStyle(.secondary)
                .navigationTitle("Tickets")
        }
    }
}

#Preview {
    ListeTicketsView()
}

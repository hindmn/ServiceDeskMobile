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
    @State private var afficherNewTicket = false
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    header
                    statistiques
                    param
                }
                .navigationTitle("Accueil")
                .sheet(isPresented: $afficherNewTicket) {
                    Text("Formulaire")
                }
                .padding(.all)
            }
        }
    }
    
    private var header: some View {
        HStack {
            Text("Tableau de bord")
                .font(.title3)
                .bold()
            Spacer()
            Text("\(ticketsViewModel.nbTotalTickets) tickets")
                .foregroundStyle(.secondary)
        }
    }
    private let rows = [GridItem(.adaptive(minimum: 140))]
    private var statistiques: some View {
        LazyVGrid(columns: rows, spacing: 10) {
            ForEach(StatutTicket.allCases) { statut in
                StatistiqueView(nombre: ticketsViewModel.nbTickets(statut: statut),
                                libelle: statut.libellePluriel)}
        }
    }
    private var param: some View {
        VStack(spacing: 10) {
            Button{
                afficherNewTicket = true
            }label: {
                Label("Nouveau ticket", systemImage: "plus.circle.fill")
                    .frame(maxWidth: .infinity)
            }.buttonStyle(.borderless)
            Spacer()
            Button{
                sectionSelectionnee = .tickets
            }label: {
                Label("Voir tous les tickets", systemImage: "list.bullet").frame(maxWidth: .greatestFiniteMagnitude)
            }.buttonStyle(.borderless)
        }
    }
}

#Preview {
    AccueilView(
        ticketsViewModel: TicketsViewModel(),
        sectionSelectionnee: .constant(.accueil)
    )
}

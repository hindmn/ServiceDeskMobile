//
//  TicketView.swift
//  ServiceDeskMobile
//
//  Created by Hind Manouzi (Étudiant) on 2026-10-16.
//
import SwiftUI

struct TicketView: View {
    @Bindable var ticketsVewModel: TicketsViewModel
    var body: some View {
        NavigationStack {
            List {
                Section {
                    statutFiltre
                    trie
                }
                Section("Les demandes") {
                    if ticketsVewModel.afficherTickets.isEmpty {
                        message
                    } else {
                        ForEach(ticketsVewModel.afficherTickets) { ticket in
                            NavigationLink(value: ticket.id) {
                                TicketsRowView(ticket: ticket)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Tickets")
        .searchable(text: $ticketsVewModel.recherchee, prompt: "Rechercher")
        .navigationDestination(for: UUID.self) {
            id in
            InformationTicketView(
                ticketsVewModel: ticketsVewModel,
                ticketID: id
            )
        }
    }
    private var message: some View {
        VStack(spacing: 8) {
            Image(systemName: "tray").font(.title)
                .foregroundStyle(.secondary)
            Text(
                ticketsVewModel.tickets.isEmpty
                    ? "Aucun ticket" : "Aucun ticket n'a été trouvé."
            )
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 15)
    }
    private var statutFiltre: some View {
        Picker("Statut", selection: $ticketsVewModel.statutFiltre) {
            Text("Tous").tag(StatutTicket?.none)
            ForEach(StatutTicket.allCases) { statut in
                Text(statut.libelle).tag(StatutTicket?.some(statut))
            }
        }.pickerStyle(.palette)
    }
    private var trie: some View {
        Picker("Trier", selection: $ticketsVewModel.ordreTri) {
            ForEach(OrdreTri.allCases) { ordre in Text(ordre.titre).tag(ordre)
            }
        }
    }
}

#Preview {
    TicketView(ticketsVewModel: TicketsViewModel())
}

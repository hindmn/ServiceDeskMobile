//
//  TicketsViewModel.swift
//  ServiceDeskMobile
//
//  Created by Hind Manouzi (Étudiant) on 2026-10-16.
//
import Foundation
import Observation

@Observable
final class TicketsViewModel {
    private(set) var tickets: [Ticket] = []
    private let store = JSONStore(nomFichier: "tickets.json")
    
    var nbTotalTickets: Int {
        tickets.count
    }
    
    init() {
        chargerTickets()
    }
    
    private func chargerTickets() {
        if let ticketsEnregistres = store.charger([Ticket].self) {
            tickets = ticketsEnregistres
        }else {
            tickets = DonneesDemo.tickets()
            enregistrer()
        }
    }
    private func enregistrer() {
        store.sauvegarder(tickets)
    }
    func nbTickets(statut: StatutTicket) -> Int {
        tickets.filter {$0.statut == statut}.count
    }
}

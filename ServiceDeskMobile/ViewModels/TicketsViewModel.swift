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
        } else {
            tickets = DonneesDemo.tickets()
            enregistrer()
        }
    }
    private func enregistrer() {
        store.sauvegarder(tickets)
    }
    func nbTickets(statut: StatutTicket) -> Int {
        tickets.filter { $0.statut == statut }.count
    }

    var recherchee = ""
    var statutFiltre: StatutTicket? = nil
    var ordreTri: OrdreTri = .plusRecent
    var afficherTickets: [Ticket] {
        let results = tickets.filter { ticket in
            rechercheTrouvee(ticket) && filtrer(ticket)
        }
        return trie(results)
    }

    private func rechercheTrouvee(_ ticket: Ticket) -> Bool {
        let texte = recherchee.trimmingCharacters(in: .whitespaces)
        guard !texte.isEmpty else { return true }
        return ticket.titre.localizedCaseInsensitiveContains(texte)
            || ticket.description.localizedCaseInsensitiveContains(texte)
            || ticket.categorie.libelle.localizedCaseInsensitiveContains(texte)
    }
    private func filtrer(_ ticket: Ticket) -> Bool {
        guard let statutFiltre else { return true }
        return ticket.statut == statutFiltre
    }
    private func trie(_ listeTicket: [Ticket]) -> [Ticket] {
        switch ordreTri {
        case .plusRecent:
            return listeTicket.sorted { $0.dateCreation > $1.dateCreation }
        case .plusAncien:
            return listeTicket.sorted { $0.dateCreation < $1.dateCreation }
        case .croissant: return listeTicket.sorted { $0.priorite < $1.priorite }
        case .decroissant:
            return listeTicket.sorted { $0.priorite > $1.priorite }
        }
    }
    func ticket(withId id: UUID) -> Ticket? {
        tickets.first { $0.id == id }
    }
    func ajouterTicket(_ ticket: Ticket) {
        guard ticket.ticketValide else { return }
        let nouveauTicket = Ticket(
            titre: ticket.titre,
            description: ticket.description,
            categorie: ticket.categorie,
            priorite: ticket.priorite
        )
        tickets.append(nouveauTicket)
        enregistrer()
    }

    func modifierTicket(_ ticket: Ticket) {
        guard ticket.ticketValide,
            let index = tickets.firstIndex(where: { $0.id == ticket.id })
        else { return }
        tickets[index] = ticket
        enregistrer()
    }
    func supprimer(id: UUID) {
        tickets.removeAll { $0.id == id }
        enregistrer()
    }
    func reinitialiser() {
        tickets = DonneesDemo.tickets()
        enregistrer()
    }
}

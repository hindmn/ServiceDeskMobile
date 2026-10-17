//
//  FormulaireView.swift
//  ServiceDeskMobile
//
//  Created by Hind Manouzi (Étudiant) on 2026-10-17.
//
import SwiftUI

struct FormulaireView: View {
    @Environment(\.dismiss) private var dismiss
    private let ticket: Ticket?
    private let save: (Ticket) -> Void
    @State private var titre: String
    @State private var description: String
    @State private var categorie: CategorieTicket
    @State private var statut: StatutTicket
    @State private var priorite: PrioriteTicket

    init(ticket: Ticket? = nil, save: @escaping (Ticket) -> Void) {
        self.ticket = ticket
        self.save = save
        _titre = State(initialValue: ticket?.titre ?? "")
        _description = State(initialValue: ticket?.description ?? "")
        _categorie = State(initialValue: ticket?.categorie ?? .materiel)
        _statut = State(initialValue: ticket?.statut ?? .nouveau)
        _priorite = State(initialValue: ticket?.priorite ?? .basse)
    }

    private var ticketEntree: Ticket {
        var resultat =
            ticket
            ?? Ticket(
                titre: "",
                description: "",
                categorie: .logiciel,
                priorite: .basse
            )
        resultat.titre = titre
        resultat.description = description
        resultat.statut = statut
        resultat.categorie = categorie
        resultat.priorite = priorite
        return resultat
    }

    var body: some View {
        NavigationStack {
            Form {
                TextField("Nom", text: $titre)
                TextField("Description", text: $description)

                Picker("Catégorie", selection: $categorie) {
                    ForEach(CategorieTicket.allCases) {
                        categorie in Text(categorie.libelle).tag(categorie)
                    }
                }
                Picker("Priorité", selection: $priorite) {
                    ForEach(PrioriteTicket.allCases) {
                        priorite in Text(priorite.libelle).tag(priorite)
                    }
                }
                if ticket != nil {
                    Picker("Statut", selection: $statut) {
                        ForEach(StatutTicket.allCases) {
                            statut in Text(statut.libelle).tag(statut)
                        }
                    }
                }
            }
            .navigationTitle(
                ticket == nil ? "Ajouter un ticket" : "Modifier le ticket"
            )
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Annuler") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Enregistrer") {
                        save(ticketEntree)
                        dismiss()
                    }
                    .disabled(!ticketEntree.ticketValide)
                }
            }
        }
    }
}

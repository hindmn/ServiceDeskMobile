//
//  DonneesDemo.swift
//  ServiceDeskMobile
//
//  Créé par Khalil Loghlam.
//  420-249-AH — Projet 1
//

import Foundation

/// Données de démonstration : 12 tickets couvrant tous les statuts,
/// toutes les priorités et toutes les catégories.
///
/// Répartition : 3 nouveaux, 4 en cours, 3 résolus, 2 fermés.
enum DonneesDemo {
    static func tickets() -> [Ticket] {
        [
            ticket("Problème Wi-Fi au 3e étage", "Le réseau sans fil se déconnecte toutes les 10 minutes dans la salle de réunion.",
                   .reseau, .haute, .enCours, joursPasses: 2),
            ticket("Installation de Microsoft Teams", "Besoin de Teams sur le portable pour les rencontres à distance.",
                   .logiciel, .basse, .resolu, joursPasses: 9),
            ticket("Impossible d'imprimer en couleur", "L'imprimante du 2e étage n'imprime qu'en noir et blanc.",
                   .imprimante, .moyenne, .ferme, joursPasses: 15),
            ticket("Mot de passe expiré", "Le mot de passe a expiré et la session ne peut plus être ouverte.",
                   .compteUtilisateur, .haute, .resolu, joursPasses: 6),
            ticket("Serveur de fichiers inaccessible", "Le dossier partagé de la comptabilité ne répond plus.",
                   .reseau, .critique, .nouveau, joursPasses: 0.2),
            ticket("Demande de formation sur Excel", "L'équipe de comptabilité souhaite une formation sur les tableaux croisés dynamiques.",
                   .autre, .basse, .enCours, joursPasses: 4),
            ticket("VPN qui se déconnecte", "Le VPN se coupe après quelques minutes en télétravail.",
                   .reseau, .haute, .nouveau, joursPasses: 1),
            ticket("Licence Adobe expirée", "Acrobat indique que la licence est expirée.",
                   .logiciel, .moyenne, .enCours, joursPasses: 5),
            ticket("Clavier défectueux", "Plusieurs touches du clavier ne répondent plus.",
                   .materiel, .basse, .resolu, joursPasses: 12),
            ticket("Accès refusé au dossier partagé", "Message « accès refusé » sur le dossier des ressources humaines.",
                   .compteUtilisateur, .haute, .enCours, joursPasses: 3),
            ticket("Bourrage papier récurrent", "L'imprimante du rez-de-chaussée se bloque à chaque impression recto verso.",
                   .imprimante, .basse, .ferme, joursPasses: 20),
            ticket("Application de paie qui plante", "L'application se ferme au moment de générer les talons de paie.",
                   .logiciel, .critique, .nouveau, joursPasses: 0.5)
        ]
    }

    private static func ticket(
        _ titre: String,
        _ description: String,
        _ categorie: CategorieTicket,
        _ priorite: PrioriteTicket,
        _ statut: StatutTicket,
        joursPasses: Double
    ) -> Ticket {
        Ticket(
            titre: titre,
            description: description,
            categorie: categorie,
            priorite: priorite,
            statut: statut,
            dateCreation: Date(timeIntervalSinceNow: -joursPasses * 86_400)
        )
    }
}

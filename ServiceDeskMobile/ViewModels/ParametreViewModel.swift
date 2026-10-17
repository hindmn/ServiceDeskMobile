//
//  ParametreViewModel.swift
//  ServiceDeskMobile
//
//  Created by Hind Manouzi (Étudiant) on 2026-10-17.
//
import Foundation
import Observation

@Observable
final class ParametreViewModel {
    private let store = JSONStore(nomFichier: "preferences.json")
    var modeSombre: Bool { didSet { enregistrer() } }

    init() {
        let parametres = store.charger(Parametre.self) ?? Parametre()
        modeSombre = parametres.modeSombre
    }
    private func enregistrer() {
        store.sauvegarder(Parametre(modeSombre: modeSombre))
    }
}

//
//  JSONStore.swift
//  ServiceDeskMobile
//
//  Créé par Khalil Loghlam.
//  420-249-AH — Projet 1
//

import Foundation

/// Lecture et écriture d'un fichier JSON dans le dossier Documents de l'application.
struct JSONStore {
    let nomFichier: String

    private var urlFichier: URL {
        URL.documentsDirectory.appending(path: nomFichier)
    }

    /// Charge le contenu du fichier.
    /// Retourne `nil` si le fichier n'existe pas encore ou si son contenu est illisible.
    func charger<T: Decodable>(_ type: T.Type) -> T? {
        guard let donnees = try? Data(contentsOf: urlFichier) else {
            return nil
        }

        do {
            let decodeur = JSONDecoder()
            decodeur.dateDecodingStrategy = .iso8601
            return try decodeur.decode(type, from: donnees)
        } catch {
            print("Lecture impossible de \(nomFichier) : \(error)")
            return nil
        }
    }

    /// Écrit la valeur dans le fichier. Retourne `true` si l'écriture a réussi.
    @discardableResult
    func sauvegarder<T: Encodable>(_ valeur: T) -> Bool {
        do {
            let encodeur = JSONEncoder()
            encodeur.outputFormatting = [.prettyPrinted, .sortedKeys]
            encodeur.dateEncodingStrategy = .iso8601
            let donnees = try encodeur.encode(valeur)
            try donnees.write(to: urlFichier, options: .atomic)
            return true
        } catch {
            print("Écriture impossible de \(nomFichier) : \(error)")
            return false
        }
    }
}

//
//  Validation.swift
//  ServiceDeskMobile
//
//  Created by Hind Manouzi (Étudiant) on 2026-10-17.
//
import Foundation

extension Ticket {
    var ticketValide: Bool {
        !titre.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

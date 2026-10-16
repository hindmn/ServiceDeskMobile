//
//  ServiceDeskMobileApp.swift
//  ServiceDeskMobile
//
//  Created by Hind Manouzi (Étudiant) on 2026-10-15.
//

import SwiftUI

@main
struct ServiceDeskMobileApp: App {
    @State private var ticketsViewModel = TicketsViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(ticketsViewModel: ticketsViewModel)
        }
    }
}

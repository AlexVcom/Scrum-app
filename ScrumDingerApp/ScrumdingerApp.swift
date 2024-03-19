//
//  ScrumDingerApp.swift
//  ScrumDingerApp
//
//  Created by Koty on 17/03/2024.
//

import SwiftUI

@main
struct ScrumDingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}

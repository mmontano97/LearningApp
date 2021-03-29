//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by michael montano on 2021-03-29.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}

//
//  OneSecondApp.swift
//  OneSecond
//
//  Created by Doran on 6/17/24.
//

import SwiftUI

@main
struct OneSecondApp: App {
    @State private var navigationManager = NavigationManager.shared
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationManager.path) {
                OnboardingView()
                    .navigationDestination(for: PathType.self) { path in
                        path.NavigatingView()
                            .navigationBarBackButtonHidden(true)
                    }
            }
//            .preferredColorScheme(.dark)
        }
    }
}

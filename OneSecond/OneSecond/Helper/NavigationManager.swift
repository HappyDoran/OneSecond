//
//  NavigationManager.swift
//  OneSecond
//
//  Created by Doran on 6/18/24.
//

import SwiftUI

enum PathType: Hashable {
    case onboarding
    case selectYear
    case quiz
    
    case quizReady(selectYear: Int, questionCount: Int, playTime: Int)
    
}

extension PathType {
    @ViewBuilder
    func NavigatingView() -> some View {
        switch self {
        case .onboarding:
            OnboardingView()
        case .selectYear:
            SelectYearView()
         
        case .quiz:
            QuizView()
        case .quizReady(let selectYear, let questionCount, let playTime):
            QuizReadyView(selectYear: selectYear, questionCount: questionCount, playTime: playTime)
        }
    }
}

@Observable
class NavigationManager {
    static let shared = NavigationManager()
    private init() {}
    
    var path: [PathType] = []
}

extension NavigationManager {
    func push(to pathType: PathType) {
        path.append(pathType)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeAll()
    }
    
    func pop(to pathType: PathType) {
        guard let lastIndex = path.lastIndex(of: pathType) else { return }
        path.removeLast(path.count - (lastIndex + 1))
    }
}


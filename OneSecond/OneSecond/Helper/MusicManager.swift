//
//  MusicManager.swift
//  OneSecond
//
//  Created by Doran on 6/17/24.
//

import Foundation
import SwiftUI
import MusicKit
import MediaPlayer

@MainActor
class MusicManager: ObservableObject {
    static let shared = MusicManager()
    private init() { }
    
    @Published var songs: [Song] = []
    @Published var genres: [Genre] = []
    private var musicPlayer = MPMusicPlayerController.applicationQueuePlayer
    
    func requestAuthorization() async -> Bool {
        let status = await MusicAuthorization.request()
        return status == .authorized
    }
    
    func fetchMusic(_ searchTerm: String) {
        Task {
            let isAuthorized = await requestAuthorization()
            guard isAuthorized else {
                print("사용자 인증에 실패하였습니다.")
                return
            }
            
            do {
                var request = MusicCatalogSearchRequest(term: searchTerm, types: [Song.self])
                request.limit = 25
                request.offset = 1
                
                let result = try await request.response()
                
                DispatchQueue.main.async {
                    self.songs = Array(result.songs)
                }
            } catch {
                print(String(describing: error))
            }
        }
    }
}


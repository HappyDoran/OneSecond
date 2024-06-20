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
    @Published var song: Song? = nil
    @Published var tracks: Set<Song> = []
    @Published var isLoading: Bool = true
    
    @Published var musicPlayer = MPMusicPlayerController.applicationQueuePlayer
    
    func requestAuthorization() async -> Bool {
        let status = await MusicAuthorization.request()
        return status == .authorized
    }
    
    func fetchMusic(_ searchTerm: String) {
        Task {
            let isAuthorized = await requestAuthorization()
            guard isAuthorized else {
                print("Authorization denied.")
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
    
    func fetchTracksFromPlaylist(year: Int) {
        Task {
            isLoading = true
            let isAuthorized = await requestAuthorization()
            guard isAuthorized else {
                print("사용자 인증에 실패하였습니다.")
                return
            }
            
            do {
                // 특정 연도의 "K-Pop Hits" 플레이리스트 검색
                var searchRequest = MusicCatalogSearchRequest(term: "K-Pop Hits: \(year)", types: [Playlist.self])
                searchRequest.limit = 1
                
                let searchResponse = try await searchRequest.response()
                
                // 검색 결과에서 첫 번째 플레이리스트 가져오기
                if let playlist = searchResponse.playlists.first {
                    print("플레이리스트를 찾았습니다: \(playlist)")
                    
                    // 플레이리스트의 트랙들을 가져오기
                    var playlistRequest = MusicCatalogResourceRequest<Playlist>(matching: \.id, equalTo: playlist.id)
                    playlistRequest.properties = [.tracks]
                    
                    let playlistResponse = try await playlistRequest.response()
                    
                    if let detailedPlaylist = playlistResponse.items.first {
                        print("상세 플레이리스트: \(detailedPlaylist)")
                        
                        let tracks = detailedPlaylist.tracks ?? []
                        let songs: [Song] = tracks.compactMap {
                            if case let .song(song) = $0 {
                                return song
                            }
                            return nil
                        }
                        
                        self.tracks = Set(songs)
                        print("트랙 목록: \(self.tracks)")
                    
                    } else {
                        print("플레이리스트의 상세 정보를 가져오지 못했습니다.")
                    }
                } else {
                    print("플레이리스트를 찾지 못했습니다.")
                }
            } catch {
                print("플레이리스트를 가져오는 데 실패했습니다: \(error)")
            }
            isLoading = false
        }
    }
    
    func getRandomTrack(time: Double) {
        if let randomSong = tracks.randomElement() {
            tracks.remove(randomSong) // set자체의 요소 접근
            print(tracks.count)
            self.song = randomSong
            
            if (time == 0) {
                playSongPlay(randomSong)
            } else {
                songPlayForTime(randomSong, time: time)
            }
        }
    }
    
    func playSongPlay(_ song: Song){
        Task {
            do {
                print(song)
                let storeID = song.id.rawValue
                let descriptor = MPMusicPlayerStoreQueueDescriptor(storeIDs: [storeID])
                musicPlayer.setQueue(with: descriptor)
                musicPlayer.play()
            }
        }
    }
    
    func songPlayForTime(_ song: Song, time: Double){
        Task {
            do {
                print(song)
                let storeID = song.id.rawValue
                let descriptor = MPMusicPlayerStoreQueueDescriptor(storeIDs: [storeID])
                musicPlayer.setQueue(with: descriptor)
                musicPlayer.play()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + time){
                    self.musicPlayer.pause()
                }
            }
        }
    }
}


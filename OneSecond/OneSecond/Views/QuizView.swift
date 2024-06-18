//
//  QuizView.swift
//  OneSecond
//
//  Created by Doran on 6/18/24.
//

import SwiftUI

struct QuizView: View {
    
    let selectYear: Int
    let questionCount: Int
    let playTime: Int
    
    @StateObject private var musicManager = MusicManager.shared
    
    var body: some View {
        VStack {
            if musicManager.isLoading {
                ProgressView("음악 데이터를 불러오는 중...")
            } else {
                List(musicManager.tracks, id: \.id) { song in
                    Text(song.title)
                }
            }
        }
        .onAppear {
            musicManager.fetchTracksFromPlaylist(year: selectYear)
        }
    }
}

#Preview {
    QuizView(selectYear: 2001, questionCount: 1, playTime: 1)
}

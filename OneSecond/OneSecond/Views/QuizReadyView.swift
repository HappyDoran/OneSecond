//
//  QuizView.swift
//  OneSecond
//
//  Created by Doran on 6/18/24.
//

import SwiftUI

struct QuizReadyView: View {
    
    let selectYear: Int
    let questionCount: Int
    let playTime: Int
    
    @StateObject private var musicManager = MusicManager.shared
    
    var body: some View {
        VStack {
            if musicManager.isLoading {
                ProgressView("음악 데이터를 불러오는 중...")
            } else {
                Button(action:{
                    NavigationManager.shared.push(to: .quiz(questionCount: questionCount, playTime: playTime))
                }){
                    Text("퀴즈 풀러가기")
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    NavigationManager.shared.pop(to: .selectYear)
                } label: {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .scaledToFit()
                        .font(.system(size: 17))
                        .bold() 
                        .foregroundStyle(.black)
                        .padding(.vertical, 11)
                }
                .frame(width: 44, height: 44)
            }
        }
        .onAppear {
            musicManager.fetchTracksFromPlaylist(year: selectYear)
        }
    }
}

#Preview {
    QuizReadyView(selectYear: 2001, questionCount: 1, playTime: 1)
}

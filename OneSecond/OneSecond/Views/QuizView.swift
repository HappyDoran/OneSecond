//
//  QuizView.swift
//  OneSecond
//
//  Created by Doran on 6/18/24.
//

import SwiftUI

struct QuizView: View {
    
    @StateObject private var musicManager = MusicManager.shared
    @State var hintCount: Int = 3
    let playTime: Int
    
    
    var body: some View {
        VStack{
            
            Text("당신의 음악 감각을 보여주세요!").font(.system(size: 24, weight: .semibold))
            
            ZStack{
                AsyncImage(url: musicManager.song?.artwork?.url(width: 260, height: 260)) { phase in
                    switch phase {
                    case .empty:
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 260, height: 260)
                            .foregroundColor(.gray)
                            .cornerRadius(50)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 260, height: 260)
                            .cornerRadius(50)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 260, height: 260)
                            .cornerRadius(50)
                            .foregroundColor(.gray)
                    @unknown default:
                        EmptyView()
                    }
                }

                if(hintCount >= 3){
                    RoundedRectangle(cornerRadius: 50).frame(width: 260,height: 260).foregroundColor(Color(hex: "#D9D9D9"))
                }
            }
            .padding(.top,20)
            
            if let artistName = musicManager.song?.artistName {
                Text(artistName).padding(.top,30).opacity(hintCount<2 ? 1 : 0)
            }
            
            Button(action:{
                if let randomSong = musicManager.song {
                    musicManager.songPlayForTime(randomSong, time: Double(playTime))
                }
            }){
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 34, height: 34)
                    .foregroundColor(Color(hex: "#000000"))
                
            }
            .padding(.top,20)
            
            Button(action:{
                hintCount-=1
                print(hintCount)
            }){
                ZStack{
                    RoundedRectangle(cornerRadius: 40).frame(width: 92,height: 38).foregroundColor(Color(hex: "#000000"))
                    Text("힌트").font(.system(size: 18, weight: .regular)).foregroundColor(.white)
                }
            }.padding(.top,10)
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
        .onAppear{
            musicManager.getRandomTrack(time: Double(playTime))
            print(musicManager.song)
        }
    }
}

#Preview {
    QuizView(playTime: 1)
}

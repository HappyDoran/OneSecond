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
                VStack{
                    Text("음악퀴즈가 곧 시작됩니다.\n긴장 푸시고, 심호흡하시고!")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.system(size:24))
                        .multilineTextAlignment(.center)
                        .padding(.top,60)
                        .padding(.bottom,-60)
                    Spacer()
                    Rectangle()
                        .fill(Color(hex: "#FF0080").opacity(0.25))
                        .cornerRadius(150)
                        .shadow(color: Color.black.opacity(0.65), radius: 25, x: 4, y: 4)
                        .blur(radius: 40)
                        .frame(width: 264, height: 264)
                        .background(
                            Rectangle()
                                .fill(Color.black.opacity(0.25))
                                .blur(radius: 250)
                        )
                    Spacer()
                    
                }
            } else {
                //                Button(action:{
                //                    NavigationManager.shared.push(to: .quiz)
                //                }){
                VStack{
                    Text("음악퀴즈가 준비됐어요.\n여러분의 실력을 보여줄 시간이에요!")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.system(size:24))
                        .multilineTextAlignment(.center)
                        .padding(.top,60)
                    Spacer()
                    Rectangle()
                        .fill(Color(hex: "#FF0080").opacity(0.51))
                        .cornerRadius(150)
                        .shadow(color: Color.black.opacity(0.65), radius: 253, x: 4, y: 4)
                        .blur(radius: 40)
                        .frame(width: 264, height: 264)
                        .background(
                            Rectangle()
                                .fill(Color.black.opacity(0.25))
                                .blur(radius: 250)
                        )
                    
                    Spacer()
                    Button(action: {
                        NavigationManager.shared.push(to: .quiz(questionCount: questionCount, playTime: playTime))
                    }){
                        Text("시작하기")
                            .foregroundColor(Color(hex: "#FFFFFF"))
                            .font(.system(size: 21))
                            .bold()
                            .frame(width:300, height:50)
                            .background(
                                RoundedRectangle(cornerRadius:55)
                                    .fill(Color(hex:"#000000")))
                            .padding(.bottom,20)
                    }/*.clipShape(RoundedRectangle(cornerRadius: 20))*/
                }
            }
            
            
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    NavigationManager.shared.pop(to: .selectYear)
                } label: {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundStyle(.black)
                        .padding(.vertical, 11)
                }
                .frame(width: 44, height: 44)
            }
        }.onAppear {
            musicManager.fetchTracksFromPlaylist(year: selectYear)
        }
    }
}

#Preview {
    QuizReadyView(selectYear: 2001, questionCount: 1, playTime: 1)
}
